import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rankway_assignment/model/home_model.dart';

class HomeService {
  Future<List<HomeModel>?> getUserApi() async {
    try {
      Dio dio = Dio();
      String url =
          "https://6405740a40597b65de377b65.mockapi.io/api/android/practical/users";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => HomeModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
