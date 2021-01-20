import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/model/Movies.dart';
import 'package:movies_app/network/MoviesManipulation.dart';
import 'package:movies_app/offlineData/local_Variables.dart';
import 'package:movies_app/ui/DetailScreen/DetailScreen.dart';
import 'package:movies_app/ui/HomeScreen/HomeScreen.dart';

class HomeScreenBody extends StatefulWidget {
  final Movies movies;
  final String category;

  const HomeScreenBody({Key key, this.category, this.movies}) : super(key: key);
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  var _movies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movies = widget.movies;
    tabController = TabController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (_movies != null)
          ? Container(
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                itemCount: _movies.results.length,
                itemBuilder: (context, index) {
                  CachedNetworkImageProvider cachedNetworkImageProvider =
                      CachedNetworkImageProvider(
                          imageUrlPrefix + _movies.results[index].posterPath);
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    movies: _movies,
                                    index: index,
                                    imageProvider: cachedNetworkImageProvider,
                                  ),
                                ));
                          },
                          child: Hero(
                              transitionOnUserGestures: true,
                              tag: index,
                              child: Image(
                                image: cachedNetworkImageProvider,
                              )),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 12,
                            child: Text(
                              "${_movies.results[index].title}",
                              maxLines: 2,
                            )),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:
                        MediaQuery.of(context).size.aspectRatio * 1.1,
                    crossAxisCount: 2),
              ),
            )
          : RefreshIndicator(

        onRefresh:() =>  MoviesManipulation().getMovies(widget.category),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text("No data "),
                  ),
                  CupertinoButton(
                      child: Text(" Refresh"),
                      onPressed: () {
                        setState(() {
                          tabController.index=categoriesList.indexOf(widget.category);
                        });
                         main();
                      })
                ],
              )),
          ),
    );
  }
}
