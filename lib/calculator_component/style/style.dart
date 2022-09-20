import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const kCustomGreenColor = Color(0xff1ad193);
const kCustomRedColor = Color(0xffff5949);
const kCustomAmberColor = Color(0xffecac48);
const kCustomBlueColor = Color(0xff2f26d9);
const kCustomLightBlueColor = Color(0xff62dbff);

SizedBox sizedheight(int num) => SizedBox(height: num.h);
SizedBox sizedWidth(int num) => SizedBox(width: num.h);

const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
final kDefaultPadding = EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h);
SnackBar snackBarCustom(String title, String message, ContentType status) {
  return SnackBar(
    elevation: 0,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: status,
    ),
  );
}

class IntroComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color colorData;
  final String imageDir;
  const IntroComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.colorData,
    required this.imageDir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorData,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageDir,
            width: double.infinity,
            height: 300.h,
          ),
          SizedBox(height: 40.h),
          Text(
            title.toUpperCase(),
            style: TextStyle(
                color: kWhiteColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.sp),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kWhiteColor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

menuCompo(String title, String imgDir, String des, VoidCallback press,
    Color colorData) {
  return Container(
    width: Get.size.width,
    height: 160.h,
    margin: EdgeInsets.only(bottom: 25.sp),
    decoration: BoxDecoration(
        color: colorData, borderRadius: BorderRadius.circular(15.r)),
    child: InkWell(
      onTap: press,
      // borderRadius: BorderRadius.circular(20.r),
      splashColor: Colors.white,
      overlayColor: MaterialStateProperty.resolveWith((states) => kWhiteColor),
      focusColor: Colors.white,
      child: Stack(children: [
        positioned(-20, -30),
        positioned(10, -40),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 50.sp,
                  ),
                  sizedheight(10),
                  Text(title,
                      style: GoogleFonts.abel(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: kWhiteColor)),
                  sizedheight(10),
                ],
              )
            ],
          ),
        ),
      ]),
    ),
  );
}

positioned(double topPosition, double rightPosition) {
  return Positioned(
      top: topPosition,
      right: rightPosition,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(0.3)),
      ));
}
