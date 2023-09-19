import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/SearchModel.dart';
import '../network/coin_api.dart';
import '../network/dio_exeptions.dart';

class SearchProvider extends ChangeNotifier{
  List<SearchModel> search = [];

  Future getAllSearch (String x) async {
    try{
      await CoinApi().getSearchURL().then((value) {
        search = value;
        notifyListeners();
      });
    }
    on DioError catch(e){
      String error = DioExceptions.fromDioError(e).toString();
      print(error);
    }
  }
}