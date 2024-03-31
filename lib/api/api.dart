import 'dart:convert';
import 'package:playflix/constants.dart';
import 'package:playflix/models/movie.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode == 200){
     final decodeData = json.decode(response.body)['results'] as List;
     print(decodeData);
     return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      
    }else{
      throw Exception('Something happened');
    }
  }
}