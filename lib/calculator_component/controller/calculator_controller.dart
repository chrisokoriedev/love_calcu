import 'package:get/get.dart';

import '../model/detailModel.dart';
import '../services/api.dart';


class CalculatorController extends GetxController {
  var isLoading = true.obs;
  var dataList =
      ResultModel(fname: '', sname: '', percentage: '', result: '').obs;
  @override
  void onInit() {
    super.onInit();
    dataFetchFromServices();
  }

  void dataFetchFromServices() async {
    try {
      isLoading(true);
      ResultModel data = await ApiGenerator().getResult();
      dataList.value = data;
    } finally {
      isLoading(false);
    }
  }
}
