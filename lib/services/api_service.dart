

import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/config/utils/constants.dart';
import 'package:netflix_clone/model/nowplaying_movie_model.dart';
import 'package:netflix_clone/model/tvseresmodel.dart';
import 'package:netflix_clone/model/upcoming_movies_model.dart';
import 'package:http/http.dart' as Http;

const key = '?api_key=$api_key';
late var endpoint;

class api_service {
  Future<UpcomingMoviesModel> getupcoming_movies() async {
    var endpoint = 'movie/upcoming';
    final url = "$base_url$endpoint$key";

    final response = await Http.get(Uri.parse(url));
    if(response.statusCode==200){
      log("Success");
      return UpcomingMoviesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed');
    

  }
  Future<NowplayingMovieModel> getnowplaying_movies() async {
    var endpoint = 'movie/now_playing';
    final url = "$base_url$endpoint$key";

    final response = await Http.get(Uri.parse(url));
    if(response.statusCode==200){
      log("Success");
      return NowplayingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed');
    

  }
  Future<TvSeriesModel> getTvSeries_movies() async {
    var endpoint = 'tv/popular';
    final url = "$base_url$endpoint$key";

    final response = await Http.get(Uri.parse(url));
    if(response.statusCode==200){
      log("Success");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed');
    

  }
}
