import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suitmedia_intern_test_flutter/Config/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      builder: (context,child){
        return GetMaterialApp(
          initialRoute: MyPage.first_screen,
          getPages: MyPage.pages,
          
        );
      },
    );
  }
}