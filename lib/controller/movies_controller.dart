import 'package:get/get.dart';
import 'package:movie_apps/model/genres.dart';
import 'package:movie_apps/model/movies.dart';
import 'package:movie_apps/service/movies_service.dart';

class MoviesController extends GetxController {
  final movies = <Movies>[].obs;
  final genres = <Genres>[].obs;
  final isLoading = true.obs;

  late MoviesService moviesService;

  MoviesController({required this.moviesService});

  @override
  void onInit() {
    readDataMovies();
    readDataGenres();
    super.onInit();
  }

  void readDataMovies() async {
    try {
      isLoading(true);
      var movie = await moviesService.fetchAllMovies();
      if (movie.isNotEmpty) {
        movies.value = movie;
      }
    } finally {
      isLoading(false);
    }
  }

  void readDataGenres() async {
    try {
      isLoading(true);
      var genre = await moviesService.fetchAllGenres();
      if (genre.isNotEmpty) {
        genres.value = genre;
      }
    } finally {
      isLoading(false);
    }
  }
}