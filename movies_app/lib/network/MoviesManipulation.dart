
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/Movies.dart';
import 'package:movies_app/offlineData/local_Variables.dart';

class MoviesManipulation{

  Future <Movies> getMovies(String category,) async{
    String url =(baseUrl+category+'?api_key='+apiKey);
    // print(url);
    final response = await http.get(url);
    if(response.statusCode==200)
      {
       final json= jsonDecode(response.body);
        return Movies.fromJson(json);
      }else{
      throw HttpException("Failed to load data");
    }


  }





}