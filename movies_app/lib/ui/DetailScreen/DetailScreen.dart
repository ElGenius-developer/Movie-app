import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/model/Movies.dart';
import 'package:movies_app/ui/DetailScreen/Alternative_AppBar_create.dart';
import 'package:movies_app/ui/DetailScreen/VotePopularityRow.dart';
import 'package:movies_app/ui/DetailScreen/createSnackBar.dart';
import 'package:movies_app/ui/DetailScreen/imageAndTitleRowFunction.dart';

class DetailScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final int index;
  final Movies movies;
  final CachedNetworkImageProvider imageProvider;
  DetailScreen({Key key, this.index, this.movies, this.imageProvider})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.pink[900],
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                //cover
                Hero(
                  tag: index,
                  child: Container(
                      width: width,
                      height: height / 2.6,
                      child: Image(
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          image: imageProvider)),
                ),
                Expanded(
                  //body after the cover  ......
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          width: width - 5,
                          height: height / 3,
                          child: imageAndTitleRowFunction(
                              globalKey: _scaffoldKey,
                              context: context,
                              index: index,
                              imageProvider: imageProvider,
                              movies: movies),
                        ), //first row
                        Container(
                            width: width - 5,
                            height: height / 8,
                            child: Card(
                              child: FittedBox(
                                child: VotePopularityRow(
                                  index: index,
                                  movies: movies,
                                ),
                              ),
                            )), //second row
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text(movies.results[index].overview),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment(.9, -.25),
              child: Container(
                  width: width / 6.5,
                  height: height / 14,
                  decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {
                      createSnackBar(
                          text: "Favourite", globalKey: _scaffoldKey);
                    },
                    icon: Icon(
                      CupertinoIcons.heart,
                      size: 25,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          Align(
            child: alternativeAppBar(context, _scaffoldKey),
            alignment: Alignment.topLeft,
          )
        ]),
      ),
    );
  }
}
