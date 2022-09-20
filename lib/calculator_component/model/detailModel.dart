class ResultModel {
  final String fname;
  final String sname;
  final String percentage;
  final String result;
  ResultModel({
    required this.fname,
    required this.sname,
    required this.percentage,
    required this.result,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        fname: json["fname"],
        sname: json["sname"],
        percentage: json["percentage"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "sname": sname,
        "percentage": percentage as int,
        "result": result,
      };
}
