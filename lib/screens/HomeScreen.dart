import 'package:final_project/provider/DetailsProvider.dart';
import 'package:final_project/provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var s = "\$";
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<DetailsProvider>(context);
    return Consumer<HomeProvider>(builder: (context,provider,child){
      return Scaffold(
        appBar: AppBar(
          title: Text("Crypto Currency"),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
            itemCount: provider.homeList.length,
            itemBuilder: (context , index ){
              return GestureDetector(
                onTap: (){pro.getAllDetails(provider.homeList[index].id);},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.11,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(21, 31, 43, 1),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text(provider.homeList[index].market_cap_rank.toString(), style: TextStyle(color: Colors.white , fontSize: 20),),
                        SizedBox(width: 10,),
                        CircleAvatar(
                          backgroundImage: NetworkImage(provider.homeList[index].image),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(provider.homeList[index].name.toString(), style: TextStyle(color: Colors.white , fontSize: 18, fontWeight: FontWeight.bold),),
                              Text(provider.homeList[index].symbol.toString(), style: TextStyle(color: Colors.white , fontSize: 15),),
                            ],
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.23,),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("${provider.homeList[index].current_price.toStringAsFixed(2)}$s", style: TextStyle(color: Colors.white , fontSize: 17, fontWeight: FontWeight.bold),),
                                Text("${provider.homeList[index].price_change_24h.toStringAsFixed(3)}$s", style: TextStyle(color: provider.homeList[index].price_change_24h >= 0 ? Colors.green : Colors.red , fontSize: 15),),
                                Text("${provider.homeList[index].price_change_percentage_24h.toStringAsFixed(3)}%", style: TextStyle(color: provider.homeList[index].price_change_percentage_24h >= 0 ? Colors.green : Colors.red , fontSize: 15),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
