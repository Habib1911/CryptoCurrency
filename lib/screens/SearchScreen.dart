import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/SearchProvider.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  bool  _searchBool = false;

  List<String> _list = ["${provider.search[index].toString()}"];
  List<int> _searchIndexList = []; //add

  Widget _searchTextField() {
    return TextField(
      autofocus: true, //Display the keyboard when TextField is displayed
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search, //Specify the action button on the keyboard
      decoration: InputDecoration( //Style of TextField
        enabledBorder: UnderlineInputBorder( //Default TextField border
            borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder( //Borders when a TextField is in focus
            borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Search....', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle( //Style of hintText
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
        onChanged: (String s) { //add
          setState(() {
            _searchIndexList = [];
            for (int i = 0; i < _list.length; i++) {
              if (_list[i].contains(s)) {
                _searchIndexList.add(i);
              }
            }
          });
        }
    );
  }

  Widget _searchListView() { //add
    return ListView.builder(
        itemCount: _searchIndexList.length, //edit
        itemBuilder: (context, index) {
          index = _searchIndexList[index]; //add
          return Padding(
            padding: const EdgeInsets.only(top: 15,right: 10,left: 10),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.11,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(21, 31, 43, 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      // backgroundImage: NetworkImage(),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_list[index],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                        Text(_list[index],style: TextStyle(color: Colors.white)),
                      ],
                    ),
                     SizedBox(width: 190,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Rank",style: TextStyle(color: Colors.white,fontSize: 17)),
                        Text("1",style: TextStyle(color: Colors.white,fontSize: 17)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget _defaultScreen() {
    return Container(
      color: Colors.black,
      child: 
      Center(
        child:
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              SvgPicture.asset("lib/assets/undraw_the_search_s0xf.svg",width:250 ,height:250 ,),
              SizedBox(height: 10,),
              Text("Search for a coin",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white24,
          title: !_searchBool ? Text("Search....") : _searchTextField(),
            actions: !_searchBool
                ? [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchBool = true;
                      _searchIndexList = []; //add
                    });
                  })
            ]
                : [
              IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchBool = false;
                    });
                  }
              )
            ],
        ),
          body: !_searchBool ? _defaultScreen() : _searchListView()
      );
  }
}
