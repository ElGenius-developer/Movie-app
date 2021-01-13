import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//add your api key
String apiKey='your Apk key ';
//you can get your own api key from  https://themoviedb.org/
String baseUrl='https://api.themoviedb.org/3/movie/';
String imageUrlPrefix='https://image.tmdb.org/t/p/w342';//the start of the image url

var categoriesList=['popular','top_rated','now_playing','upcoming'];
var categoriesNames=['Popular','Top Rated','Now Playing','Upcoming'];
var orangeColor = Color(0xffFBFCFC );
var iconsList=[
  Icon( Icons.local_fire_department_outlined,color: orangeColor,),
  Icon( Icons.star,color: orangeColor,),
  Icon( Icons.play_circle_fill,color: orangeColor),
  Icon( CupertinoIcons.clock,color: orangeColor),

];

 TabController tabController;




