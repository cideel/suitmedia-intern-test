import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:suitmedia_intern_test_flutter/Model/user.dart';

class UserController extends GetxController{
   var name = ''.obs;
   var selectedUser = ''.obs;

  var users = <User>[].obs;
  var currentPage = 1.obs;
  var isLoading = false.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers({int page = 1}) async {
    if (isLoading.value) return;

    isLoading.value = true;
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=1&per_page=10'),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<User> newUsers = (data['data'] as List)
          .map((user) => User.fromJson(user))
          .toList();

      if (newUsers.isNotEmpty) {
        users.addAll(newUsers);
        currentPage.value++;
      } else {
        hasMore.value = false;
      }
    }
    isLoading.value = false;
  }

  void refreshUsers() {
    users.clear();
    currentPage.value = 1;
    hasMore.value = true;
    fetchUsers();
  }
}