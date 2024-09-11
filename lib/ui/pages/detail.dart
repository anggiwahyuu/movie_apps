import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_apps/controller/movies_controller.dart';
import 'package:movie_apps/service/movies_service.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final MoviesController moviesController = Get.put(MoviesController(moviesService: Get.find<MoviesService>()));

  final indexFromPrevious = Get.arguments as int;

  final genres = "".obs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(), 
          icon: const Icon(
            Icons.arrow_back,
            size: 50,
            color: Colors.white,
          )
        ),
      ),
      body: Obx(() {
        
        if (moviesController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://image.tmdb.org/t/p/original${moviesController.movies[indexFromPrevious].posterPath}"),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          moviesController.movies[indexFromPrevious].title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        Row(
                          children: [
                            const Icon(Icons.calendar_month, color: Colors.grey,),
                            const SizedBox(width: 3,),
                            Text(
                              moviesController.movies[indexFromPrevious].releaseDate,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black
                              ),
                            ),

                            const SizedBox(width: 20,),

                            const Icon(Icons.star, color: Colors.yellow,),
                            const SizedBox(width: 3,),
                            Text(
                              "${moviesController.movies[indexFromPrevious].voteAverage.toStringAsFixed(1)}/10",
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),

                            const SizedBox(width: 20,),

                            const Icon(Icons.person, color: Colors.grey,),
                            const SizedBox(width: 3,),
                            Text(
                              "${moviesController.movies[indexFromPrevious].voteCount}",
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                    
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 25.0),
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: moviesController.movies[indexFromPrevious].genreIds.length,
                            itemBuilder: (context, index) {
                              for (int i = 0; i < moviesController.genres.length; i++) {
                                if (moviesController.movies[indexFromPrevious].genreIds[index] == moviesController.genres[i].id) {
                                  genres.value = moviesController.genres[i].name;
                                }
                              }
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(right: 10),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(
                                  child: Text(genres.value),
                                ),
                              );
                            }
                          ),
                        ),

                        const Text(
                          "Overview",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        Text(
                          moviesController.movies[indexFromPrevious].overview,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}