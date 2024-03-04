import 'package:flutter/material.dart';
import 'package:the_movie_v2/navigation/router.dart';

class TheMovieV2 extends StatelessWidget {
  const TheMovieV2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
