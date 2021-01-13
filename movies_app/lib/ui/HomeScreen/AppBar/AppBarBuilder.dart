import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app/offlineData/local_Variables.dart';
import 'package:movies_app/ui/HomeScreen/AppBar/ChangeCategory.dart';

import '../HomeScreen.dart';


Widget appBarBuilder(/*{String title}*/){
return  AppBar(
  toolbarHeight: 125,
  title: Text("Movies"),
  backgroundColor: Colors.pink[500],
  bottom: TabBar(


    controller: tabController,
    indicatorColor: Colors.white,
    tabs: List.generate(categoriesNames.length, (index) =>
        Tab(
          icon: IconShadowWidget(
            iconsList[index], shadowColor: Colors.orangeAccent,) ,
          child: Text(
            categoriesNames[index], style: TextStyle(
              fontSize: 10.4
          ),),

        )).toList(),
  ),
  actions: [
    ChangeCategory(),
  ],
);





}