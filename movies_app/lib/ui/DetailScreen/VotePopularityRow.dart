import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/Movies.dart';

class VotePopularityRow extends StatelessWidget {
  final Movies movies;
  final int index;

  const VotePopularityRow({Key key, this.movies, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment:Alignment.topLeft ,

          child: Column(


            children: [
              Stack(
                alignment: Alignment.center,
                children: [//34.19,25.2
                  Icon(CupertinoIcons.hexagon,size: 34.19,color: Colors.red[900],),
                  Icon(CupertinoIcons.hexagon_fill ,size: 25.2,color: Colors.red[900],),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${movies.results[index].voteAverage}",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.5
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${movies.results[index].voteCount} votes",
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45
                  ),),
              )

            ],
          ),
        ),
        Align(
          alignment:Alignment.topLeft ,

          child: Column(


            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(CupertinoIcons.circle,size: 34.2,color: Colors.red[900],),
                  Icon(CupertinoIcons.circle_fill ,size: 27.28,color: Colors.red[900],),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${movies.results[index].popularity.round()}",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.5
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" popularity ",
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45
                  ),),
              )

            ],
          ),
        ),
        Align(
          alignment:Alignment.topLeft ,

          child: Column(


            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(CupertinoIcons.circle,size: 34.19,color: Colors.red[900],),
                  Icon(CupertinoIcons.circle_fill ,size: 27.28,color: Colors.red[900],),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${movies.results[index].originalLanguage}",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.5
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Language",
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45
                  ),),
              )

            ],
          ),
        ),

      ],
    );
  }
}
