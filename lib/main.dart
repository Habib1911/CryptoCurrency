
import 'package:final_project/provider/DetailsProvider.dart';
import 'package:final_project/provider/HomeProvider.dart';
import 'package:final_project/provider/SearchProvider.dart';
import 'package:final_project/screens/DetailScreen.dart';
import 'package:final_project/screens/HomeScreen.dart';
import 'package:final_project/screens/NavBar.dart';
import 'package:final_project/screens/ProfileScreen.dart';
import 'package:final_project/screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>HomeProvider()),
    ChangeNotifierProvider(create: (context)=>DetailsProvider()),
    ChangeNotifierProvider(create: (context)=>SearchProvider()),
  ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}
