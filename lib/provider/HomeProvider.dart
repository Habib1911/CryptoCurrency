import 'package:dio/dio.dart';
import 'package:final_project/network/coin_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../models/HomeModel.dart';
import '../network/dio_exeptions.dart';

class HomeProvider extends ChangeNotifier {
  List<HomeModel>homeList=[];
  HomeProvider(){
    getAllCoins();
  }
  Future getAllCoins ()async{
    try{
      await CoinApi().getHomeUrl().then((value){homeList = value;
      notifyListeners();
      });
    }
    on DioError catch (e) {
      String error =  DioExceptions.fromDioError(e).toString();
      print(error);
      Get.dialog(AlertDialog(
        backgroundColor: Colors.grey,
        title: Text("Error"),
        content: Text(error),
        actions: [
          TextButton(onPressed:(){
            getAllCoins();
            Get.back();
          }, child: Text("Ok",style: TextStyle(color: Colors.black),))
        ],
      ));
    }
  }
}