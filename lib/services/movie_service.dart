
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nicolas_flutter_final_assignment/models/movie_model.dart';

class MovieService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "/popular";
  static const String nowPlaying = "/now-playing";
  static const String comingSoon = "/coming-soon";
  static const String detail = "/movie";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstance = [];

    Uri uri = Uri.parse("$baseUrl$popular");

   var response = await http.get(uri);
   if (response.statusCode == 200) {
     var responseInJson = jsonDecode(response.body);
     var rawResponse = RawResponse.fromJson(responseInJson);
     var aaa = rawResponse.results;
     for (var elm in aaa) {
       movieInstance.add(MovieModel.fromJson(elm));
    }
    return movieInstance;
   }
   throw Error();
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> movieInstance = [];

    Uri uri = Uri.parse("$baseUrl$nowPlaying");

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var rawResponseInJson = jsonDecode(response.body);
      var rawResponse = RawResponse.fromJson(rawResponseInJson);

      var rawResult = rawResponse.results;
      for (var elm in rawResult) {
        movieInstance.add(MovieModel.fromJson(elm));
      }
      return movieInstance;
    } else {
    }
    throw Error();
  }

  static Future<List<MovieModel>> getMoviesComingSoon() async {
    List<MovieModel> movieInstance = [];

    Uri uri = Uri.parse("$baseUrl$comingSoon");

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var rawResponseInJson = jsonDecode(response.body);
      var rawResponse = RawResponse.fromJson(rawResponseInJson);

      var rawResult = rawResponse.results;
      for (var elm in rawResult) {
        movieInstance.add(MovieModel.fromJson(elm));
      }
      return movieInstance;
    } else {
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMoviesDetail(int id) async {
    Uri uri = Uri.parse("$baseUrl$detail?id=$id");

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var rawResponseInJson = jsonDecode(response.body);
      return MovieDetailModel.fromJson(rawResponseInJson);
    }
    throw Error();
  }
}