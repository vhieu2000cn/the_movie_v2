import 'package:flutter/material.dart';
import 'package:the_movie_v2/screens/about.dart';
import 'package:the_movie_v2/screens/detail.dart';
import 'package:the_movie_v2/screens/favorite_list.dart';
import 'package:the_movie_v2/screens/movie_list.dart';
import 'package:the_movie_v2/screens/setting.dart';

enum Screens {
  movieList(
      screenName: 'Movie List',
      iconData: Icons.home,
      router: '/movie_list',
      screen: MovieListScreen(),
      nestedScreen: [Screens.movieDetail]),
  favoriteList(
      screenName: 'Favorite',
      iconData: Icons.favorite,
      router: '/favorite',
      screen: FavoriteScreen()),
  setting(
      screenName: 'Setting',
      iconData: Icons.settings,
      router: '/setting',
      screen: SettingScreen()),
  about(
      screenName: 'About',
      iconData: Icons.person,
      router: '/about',
      screen: AboutScreen()),
  movieDetail(
      screenName: 'Movie Detail',
      iconData: Icons.movie,
      router: 'movie_detail',
      screen: DetailScreen());

  final String screenName;
  final String router;
  final IconData iconData;
  final Widget screen;
  final List<Screens>? nestedScreen;

    const Screens(
      {required this.screenName,
      required this.iconData,
      required this.router,
      required this.screen,
      this.nestedScreen});
}
