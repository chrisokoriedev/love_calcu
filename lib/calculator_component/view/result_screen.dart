import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:love_calcu/calculator_component/style/style.dart';

import '../controller/calculator_controller.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  final CalculatorController calculatorController =
      Get.put(CalculatorController());

  var percentage;
  @override
  initState() {
    percentage = double.parse(calculatorController.dataList.value.percentage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        child: Container(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedheight(30),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  color: kCustomRedColor,
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.sp,
                    color: kWhiteColor,
                    semanticLabel: 'arrow back',
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    sizedheight(50),
                    calculatorController.isLoading.isTrue
                        ? const CircularProgressIndicator()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              percentage <= 49
                                  ? Image.asset(
                                      'assets/move.png',
                                      width: 250.w,
                                    )
                                  : Image.asset(
                                      'assets/happy.png',
                                      width: 250.w,
                                      alignment: Alignment.center,
                                    ),
                              title('First Name'),
                              sizedheight(5),
                              nameCompo(calculatorController
                                  .dataList.value.fname
                                  .toUpperCase()),
                              sizedheight(10),
                              title('Second Name'),
                              sizedheight(5),
                              nameCompo(calculatorController
                                  .dataList.value.sname
                                  .toUpperCase()),
                              sizedheight(10),
                              Countup(
                                begin: 0,
                                end: percentage,
                                duration: const Duration(seconds: 3),
                                separator: ',',
                                style: GoogleFonts.domine(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              sizedheight(10),
                              Text(
                                calculatorController.dataList.value.result,
                                style: GoogleFonts.abel(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  nameCompo(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 30.sp, fontWeight: FontWeight.w600, color: kCustomRedColor),
    );
  }

  title(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: kCustomGreenColor),
    );
  }
}
