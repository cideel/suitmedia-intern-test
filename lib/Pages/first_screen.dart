import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suitmedia_intern_test_flutter/Config/router.dart';
import 'package:suitmedia_intern_test_flutter/Controller/palindrom_checked.dart';
import 'package:suitmedia_intern_test_flutter/Controller/user_controller.dart';

class FirstScreen extends StatelessWidget {
  final PalindromChecked palindromChecked = Get.put(PalindromChecked());
  final UserController userController =  Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 815),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/background.png',
                    ),
                    fit: BoxFit.cover)),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                    Image.asset(
                      'assets/ic_photo.png',
                      width: 116.w,
                      height: 116.h,
                    ),
                    SizedBox(
                      height: 51.h,
                    ),
                    Container(
                      width: 310.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border:
                              Border.all(style: BorderStyle.solid, width: 0.5)),
                      child: TextField(
                        onChanged: (value) => userController.name.value = value,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            hintText: "Name",
                            hintStyle: TextStyle(fontWeight: FontWeight.w300)),
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Container(
                      width: 310.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border:
                              Border.all(style: BorderStyle.solid, width: 0.5)),
                      child: TextField(
                        onChanged: (value) =>
                            palindromChecked.sentece.value = value,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            hintText: "Palindrome",
                            hintStyle: TextStyle(fontWeight: FontWeight.w300)),
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    Container(
                      height: 41.h,
                      width: 310.w,
                      decoration: BoxDecoration(
                          color: Color(0xff2B637B),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2B637B)),
                          onPressed: () {
                            bool result = palindromChecked
                                .checkPalindrome(palindromChecked.sentece.value);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Palindrome Check",
                                      style: GoogleFonts.poppins(),
                                    ),
                                    content: Text(
                                      result ? 'Palindrome' : "Not Palindrome",
                                      style: GoogleFonts.poppins(),
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      }, child: Text("OK"))
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "CHECK",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 41.h,
                      width: 310.w,
                      decoration: BoxDecoration(
                          color: Color(0xff2B637B),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff2B637B)),
                          onPressed: (){
                            Get.toNamed(MyPage.second_screen);
                          },
                          child: Text(
                            "NEXT",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
