import 'package:get/get.dart';
import 'package:suitmedia_intern_test_flutter/Pages/first_screen.dart';
import 'package:suitmedia_intern_test_flutter/Pages/second_screen.dart';
import 'package:suitmedia_intern_test_flutter/Pages/third_screen.dart';

class MyPage {
  static final pages = [
    GetPage(name: first_screen, page: ()=>FirstScreen()),
    GetPage(name: second_screen, page: ()=>SecondScreen()),
    GetPage(name: third_screen, page: ()=>ThirdScreen())
  ];

  static getFirst() => FirstScreen();
  static getSecond()=> SecondScreen();
  static getThird()=> ThirdScreen();

  static String first_screen = '/first';
  static String second_screen = '/second';
  static String third_screen = '/third';

  
}