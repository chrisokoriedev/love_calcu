import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'calculator_component/style/style.dart';
import 'calculator_component/view/caculator_screen.dart';

class MyMenuScreen extends StatelessWidget {
  const MyMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sizedheight(60),
            Text(
              'Welcome to Mera',
              style: TextStyle(fontSize: 30.sp),
            ),
            sizedheight(40),
            menuCompo(
                'Love Calculator',
                'assets/calculator.png',
                'Love meter is an online love detector with which you can measure the percentage of love compatibility and chances of successful relationship between two people.',
                () => Get.to(const CalculatorScreen()),
                kCustomGreenColor),
            menuCompo(
                'Daily Live Horoscope',
                'assets/calculator.png',
                'A horoscope is an astrological chart or diagram representing the positions of the Sun, Moon, planets, astrological aspects and sensitive angles at the time of an event, such as the moment of a person',
                () {},
                kCustomAmberColor),
           
          ],
        ),
      ),
    );
  }
}
