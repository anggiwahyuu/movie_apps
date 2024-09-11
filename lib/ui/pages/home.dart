import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_apps/controller/movies_controller.dart';
import 'package:movie_apps/service/movies_service.dart';
import 'package:movie_apps/ui/components/cards.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final MoviesController moviesController = Get.put(MoviesController(moviesService: Get.find<MoviesService>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Selamat Datang", style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: Obx(() {
          if (moviesController.isLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: moviesController.movies.length,
              itemBuilder: (context, index) {
                return Cards(
                  image: moviesController.movies[index].posterPath, 
                  title: moviesController.movies[index].title,
                  overview: moviesController.movies[index].overview,
                  index: index,
                );
              }
            );
          }
        }),
      ),
    );
  }
}