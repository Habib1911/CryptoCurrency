import 'package:dio/dio.dart';
import 'package:final_project/screens/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/DetailsModel.dart';
import '../network/coin_api.dart';
import '../network/dio_exeptions.dart';

class DetailsProvider extends ChangeNotifier {
  DetailsModel detailsList = DetailsModel(
      id: '',
      name: '',
      symbol: '',
      description:'' ,
      image: '',
      market_cap_rank: 0,
      currentPrice: 0,
      percentChange_24h: 0,
      percentChange_7d: 0,
      percentChange_14: 0,
      percentChange_30: 0,
      percentChange_60: 0,
      percentChange_200: 0,
      percentChange_1y: 0);

  Future getAllDetails(String x) async {
    try {
      await CoinApi().getDetailsURL(x).then((value) {
        detailsList = value;
        Get.to(DetailScreen());
      });
    }
    on DioError catch (e) {
      String error = DioExceptions.fromDioError(e).toString();
      print(error);
    }
  }

}
