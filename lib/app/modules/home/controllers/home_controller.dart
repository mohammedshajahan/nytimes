import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/app/modules/home/model/most_viewed_model.dart';

import '../../../network/helper.dart';
import '../../../network/network.dart';
import '../../../network/response.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  bool? isLoading = true;
  MostViewedModel? mostViewedModel;
  List<MostViewedModel>? mostViewedList;
  @override
  void onInit() {
    super.onInit();
  }

  Future<dynamic> getMostViewed() async {
    try {
      CustomeResponse? response = await apiBaseHelper.request(
        url:
            "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=l9wIFHZ94o53agw31CVM8XI6JdWCmwqK",
        method: HTTPMETHOD.GET,
      );

      if (response.success!) {
        final responseData = response.data as List;
        mostViewedList = responseData
            .map<MostViewedModel>((json) => MostViewedModel.fromMap(json))
            .toList();
        isLoading = false;
        update();
        return true;
      } else {
        isLoading = false;
        Get.snackbar("Oh!!", response.message!,
            backgroundColor: Colors.red, colorText: Colors.white);
        update();
      }
    } catch (e) {
      Get.snackbar("Alert", "Error fetching Records");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

 // "${Helpers.get_most_viewed}/"
        //     "all-sections/7.json?"
        //     "${Helpers.apikey}",
