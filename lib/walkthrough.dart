import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:love_calcu/calculator_component/services/api.dart';
import 'package:love_calcu/calculator_component/view/caculator_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'calculator_component/style/style.dart';
import 'main_control.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final pages = [
    const IntroComponent(
        title: 'get a long',
        subtitle: 'Spare time the person \n who needs you',
        colorData: kCustomGreenColor,
        imageDir: 'assets/getLong.png'),
    const IntroComponent(
        title: 'cherish love',
        subtitle: 'Your wait for being able to \n cherish love has now ended',
        colorData: kCustomAmberColor,
        imageDir: 'assets/cherish.png'),
    const IntroComponent(
        title: 'ohh break up',
        subtitle:
            'Dont worry we have got you \n covered, someone might be waiting for you?',
        colorData: kCustomLightBlueColor,
        imageDir: 'assets/move.png'),
  ];
  final LiquidController liquidController = LiquidController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) => LiquidSwipe(
              enableSideReveal: true,
              liquidController: liquidController,
              onPageChangeCallback: ((activePageIndex) => setState(() {
                    isLastPage = activePageIndex == 2;
                  })),
              waveType: WaveType.liquidReveal,
              enableLoop: false,
              slideIconWidget: isLastPage == true
                  ? Container()
                  : const Icon(
                      Icons.arrow_circle_right,
                      color: kWhiteColor,
                    ),
              pages: pages,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 32,
            child: Container(
              padding: kDefaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isLastPage
                      ? Container()
                      : InkWell(
                          onTap: (() => liquidController.jumpToPage(
                                page: 2,
                              )),
                          child: Text(
                            'Skip',
                            style:
                                TextStyle(color: kWhiteColor, fontSize: 24.sp),
                          )),
                  AnimatedSmoothIndicator(
                    activeIndex: liquidController.currentPage,
                    count: 3,
                    effect: const WormEffect(
                        spacing: 16,
                        dotColor: kWhiteColor,
                        activeDotColor: kCustomRedColor),
                    onDotClicked: ((index) =>
                        liquidController.animateToPage(page: index)),
                  ),
                  isLastPage
                      ? InkWell(
                          onTap: () {
                            boxHive.put('done', true);
                            Get.to(const CalculatorScreen());
                          },
                          child: Text(
                            'Done',
                            style:
                                TextStyle(color: kWhiteColor, fontSize: 24.sp),
                          ))
                      : InkWell(
                          onTap: (() {
                            final page = liquidController.currentPage + 1;
                            liquidController.animateToPage(
                                page: page > 3 ? 0 : page, duration: 500);
                          }),
                          child: Text(
                            'Next',
                            style:
                                TextStyle(color: kWhiteColor, fontSize: 24.sp),
                          )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
