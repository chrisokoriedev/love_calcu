import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:love_calcu/calculator_component/services/api.dart';
import 'package:love_calcu/main_control.dart';
import 'package:love_calcu/welcome.dart';

import 'package:path_provider/path_provider.dart' as path;

import 'calculator_component/style/style.dart';
import 'calculator_component/view/caculator_screen.dart';

var box = Hive.box('myBox');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kWhiteColor,
          primarySwatch: Colors.blue,
        ),
        home: boxHive.get('done')==true
            ? const CalculatorScreen()
            : const WelcomePage(),
      ),
    );
  }
}
