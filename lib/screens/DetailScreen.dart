import 'package:final_project/provider/DetailsProvider.dart';
import 'package:final_project/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var s = "\$";

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20,top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 15,),
            Container(
              child: Stack(
                children: [
                  Container(
                      width: double.infinity,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.25,
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: Image.network(provider.detailsList.image,
                            fit: BoxFit.cover),
                      )
                  ),
                  IconButton(
                    onPressed:
                        () {
                      Get.offAll(HomeScreen());
                    },
                    icon:
                    Icon(Icons.chevron_left),
                    color: Colors.white,
                    iconSize: 35,
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.detailsList.name.toString(), style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),),
                SizedBox(width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.10,),
                Container(child:
                    Row(
                      children: [
                        Text("Rank", style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child:
                          Center(
                            child: Text(
                              provider.detailsList.market_cap_rank.toString(),
                              style: TextStyle(color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    )
                ),
                  ],
                ),
                Text(provider.detailsList.symbol.toString(),
                  style: TextStyle(color: Colors.white60, fontSize: 20),),
                SizedBox(height: 10,),
                Text("Price", style: TextStyle(color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("$s ${provider.detailsList.currentPrice.toString()}",
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(width: 10,),
                    Text(
                      "${provider.detailsList.percentChange_24h.toString()}%",
                      style: TextStyle(color: Colors.green, fontSize: 18),),
                  ],
                ),
                SizedBox(height: 200,),
                Text("Description", style: TextStyle(color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Html(
                    data: provider.detailsList!.description.toString(),
                    style: {
                      "body": Style(
                        fontSize: FontSize(13.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    },
                  )
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
