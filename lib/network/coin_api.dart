import 'package:dio/dio.dart';
import 'package:final_project/models/DetailsModel.dart';
import 'package:final_project/models/SearchModel.dart';

import '../core/constant.dart';
import '../models/HomeModel.dart';

class CoinApi {
  Future<List<HomeModel>> getHomeUrl() async {
    try {
      var response = await Dio().get(baseUrl + homeUrl);
      return List<HomeModel>.from(
          response.data.map((x) => HomeModel.fromJson(x)));

    }

    catch (e) {
      rethrow;
    }
  }
  Future getDetailsURL(String x)async {
    try{
      var response = await Dio().get(baseUrl + detailsUrl + x);
      return DetailsModel.fromJson(response.data);

    }
    catch(e){
      rethrow;
    }
  }
  Future getSearchURL()async {
    try{
      var response = await Dio().get(baseUrl + searchUrl);
      return SearchModel.fromJson(response.data);

    }
    catch(e){
      rethrow;
    }
  }
}