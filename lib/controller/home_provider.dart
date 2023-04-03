import 'package:flutter/material.dart';
import 'package:rankway_assignment/model/home_model.dart';
import 'package:rankway_assignment/service/home_service.dart';

class HomeProvider extends ChangeNotifier {
  List<HomeModel> userList = [];
  bool isLoading = false;

  void fetchApi() async {
    isLoading = true;
    await HomeService().getUserApi().then((value) {
      if (value != null) {
        userList = value;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }
}
