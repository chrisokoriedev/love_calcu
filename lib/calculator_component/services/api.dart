import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/detailModel.dart';
import '../view/result_screen.dart';

var boxHive = Hive.box('myBox');

class ApiGenerator {
  final Dio _dio = Dio();
  var apiEndPoint = 'https://love-calculator.p.rapidapi.com/getPercentage';

  Future getResult() async {
    final apiResult = await _dio.get(apiEndPoint,
        queryParameters: {
          'fname': boxHive.get('firstName'),
          'sname': boxHive.get('secondName'),
        },
        options: Options(headers: {
          'X-RapidAPI-Key':
              'f3517d0079mshab66d20c2d4c63bp180400jsna5343bc48b7c',
          'X-RapidAPI-Host': 'love-calculator.p.rapidapi.com',
        }));
    if (apiResult.statusCode == 200) {
      print(apiResult);
      final dataDetail = apiResult.data;
      final endpoint = ResultModel.fromJson(dataDetail);
      Get.to(ResultScreen());
      return endpoint;
    } else {
      Get.snackbar('status', 'Something went wrong');
    }
  }
}
