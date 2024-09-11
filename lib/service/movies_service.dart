import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_apps/model/genres.dart';
import 'package:movie_apps/model/movies.dart';

class MoviesService extends GetxService {
  Dio dio = Dio();
  static const apiKey = "b566e00ee59f65534bf54c0ba999de05";

  Future<List<Movies>> fetchAllMovies() async {
    String url = "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = response.data;
        final data = jsonResponse["results"];

        List<Movies> results = List.from(data.map((movie) => Movies.fromJson(movie)));

        return results.toList();
      }

      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Genres>> fetchAllGenres() async {
    String url = "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey";

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = response.data;
        final data = jsonResponse["genres"];

        List<Genres> results = List.from(data.map((genre) => Genres.fromJson(genre)));

        return results;
      }

      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}