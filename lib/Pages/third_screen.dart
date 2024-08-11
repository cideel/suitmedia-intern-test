import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suitmedia_intern_test_flutter/Controller/user_controller.dart';

class ThirdScreen extends StatelessWidget {
  final UserController controller = Get.find<UserController>();

  ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 815),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Third Screen",
              style: GoogleFonts.poppins(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          body: Obx(() {
            if (controller.isLoading.value && controller.users.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.users.isEmpty) {
              return Center(child: Text('No users available'));
            } else {
              return ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  var user = controller.users[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 38.w),
                    leading: Container(
                      width: 49.w,
                      height: 49.h,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                    ),
                    title: Text(
                      "${user.firstName} ${user.lastName}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      controller.selectedUser.value =
                          "${user.firstName} ${user.lastName}";
                      Get.back();  // Go back to the previous screen
                    },
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
