import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_apps/service/movies_service.dart';
import 'package:movie_apps/ui/pages/detail.dart';
import 'package:movie_apps/ui/pages/get_started.dart';
import 'package:movie_apps/ui/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(MoviesService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => GetStarted()),
        GetPage(name: "/home", page: () => MyHomePage()),
        GetPage(name: "/detail", page: () => DetailPage())
      ],
    );
  }
}