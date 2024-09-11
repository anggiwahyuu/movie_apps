import 'package:get/get.dart';
import 'package:movie_apps/service/movies_service.dart';

class MoviesController extends GetxController {
  final movies = [].obs;
  final isLoading = true.obs;

  late MoviesService moviesService;

  MoviesController({required this.moviesService});

  @override
  void onInit() {
    super.onInit();
    readDataMovies();
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
}