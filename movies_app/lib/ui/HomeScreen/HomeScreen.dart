import 'package:flutter/material.dart';
 import 'package:movies_app/model/Movies.dart';
import 'package:movies_app/network/MoviesManipulation.dart';
import 'package:movies_app/offlineData/local_Variables.dart';
import 'package:movies_app/ui/HomeScreen/AppBar/AppBarBuilder.dart';
 import 'package:movies_app/ui/HomeScreen/HomeScreenComponent/CustomCircularIndicator.dart';
import 'package:movies_app/ui/HomeScreen/HomeScreenComponent/HomeScreenBody.dart';

class HomeScreen extends StatefulWidget {
  final category;

  const HomeScreen({Key key, this.category}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{
  var _movies = new Movies();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=  TabController(vsync: this, length: categoriesList.length);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: appBarBuilder(),
      //appBarBuilder(title: categoriesNames[categoriesList.indexOf(_categ)]),
      body: Center(
        child: TabBarView(
          controller: tabController,
          children:
          categoriesList.map((e) => FutureBuilder(
            future: MoviesManipulation().getMovies(e),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _movies = snapshot.data;

                return RefreshIndicator(

                  notificationPredicate: (notification) => true,
                  onRefresh: () {

                    return MoviesManipulation().getMovies(e).then((
                        value) {
                      setState(() {
                        _movies = value;
                      });
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: HomeScreenBody(
                      movies: _movies, category: e,),
                  ),
                );

              } else {
                return
                  Center(
                      child: Container(
                        height: height / 7.5,
                        width: width / 3.5,
                        child: buildLiquidCircularProgressIndicator(),
                      )
                  );
              }
            },
          )).toList(),
        ),
      ),

    );

  }
}