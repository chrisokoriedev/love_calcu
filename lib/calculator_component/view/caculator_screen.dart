import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:love_calcu/calculator_component/style/style.dart';

import '../../main.dart';
import '../controller/calculator_controller.dart';
import '../services/api.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with TickerProviderStateMixin {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedheight(50),
              sizedheight(200),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Love Calculator',
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600),
                  ),
                  sizedheight(10),
                  Text(
                    'For Fun',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: kCustomGreenColor,
                        fontWeight: FontWeight.w600),
                  ),
                  sizedheight(50),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: kBlackColor),
                        ),
                        TextFormField(
                          controller: firstController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              var snackBar = snackBarCustom(
                                  'On Snap!',
                                  'Enter first name to proceed!',
                                  ContentType.warning);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Second Name',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: kBlackColor),
                        ),
                        TextFormField(
                          controller: secondcontroller,
                          decoration: const InputDecoration(),
                          validator: (text) {
                            if (text!.isEmpty) {
                              var snackBar = snackBarCustom(
                                  'On Snap!',
                                  'Enter second name to proceed!',
                                  ContentType.warning);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            return null;
                          },
                        ),
                        sizedheight(40),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (firstController.text.isNotEmpty &&
                                  secondcontroller.text.isNotEmpty) {
                                if (mounted) {
                                  box.put('firstName', firstController.text);
                                  box.put('secondName', secondcontroller.text);
                                  var snackBar = snackBarCustom(
                                      'Nice', 'Loading', ContentType.success);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  setState(() {
                                    final CalculatorController
                                        calculatorController =
                                        Get.put(CalculatorController());
                                    calculatorController.onInit();
                                  });
                                  ApiGenerator().getResult();
                                }
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: kCustomAmberColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Text(
                              'Check it !',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
