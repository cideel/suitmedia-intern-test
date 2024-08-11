import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suitmedia_intern_test_flutter/Config/router.dart';
import 'package:suitmedia_intern_test_flutter/Controller/user_controller.dart';

class SecondScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 815),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: Text(
              "Second Screen",
              style: GoogleFonts.poppins(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 48.h,
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    textAlign: TextAlign.left,
                    "Welcome",
                    style: GoogleFonts.poppins(fontSize: 12.sp),
                  )),
              SizedBox(
                height: 0.h,
              ),
              Obx(() => Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    userController.name.value,
                    style: GoogleFonts.poppins(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ))),
              SizedBox(
                height: 222.h,
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Selected User :",
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 8.h,
              ),
              Obx(() => Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    userController.selectedUser.value,
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ))),
              SizedBox(
                height: 250.h,
              ),
              Container(
                width: 310.w,
                height: 41.h,
                decoration: BoxDecoration(
                    color: Color(0xff2B637B),
                    borderRadius: BorderRadius.circular(12.r)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff2B637B)),
                    onPressed: () {
                      Get.toNamed(MyPage.third_screen);
                    },
                    child: Text(
                      "Choose a user",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
