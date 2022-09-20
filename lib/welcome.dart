import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:love_calcu/walkthrough.dart';

import 'calculator_component/style/style.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: kDefaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/welcome.png',
              width: double.infinity,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'It fun and many more.'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.sp),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: (() => Get.to(
                    const WalkThroughScreen(),
                  )),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                    color: kCustomRedColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
