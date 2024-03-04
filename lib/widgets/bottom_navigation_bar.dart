import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_v2/bloc/setting_app/setting_app_bloc.dart';
import 'package:the_movie_v2/bloc/setting_app/setting_app_state.dart';
import 'package:the_movie_v2/commons/setting_app_share_preferences.dart';
import 'package:the_movie_v2/navigation/configs.dart';
import 'package:the_movie_v2/widget/drawer_menu.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: SettingAppSharePreferences.getModeView(),
      builder: (context, state) => BlocProvider(
        create: (context) => SettingAppBloc(
            modeViewMovieList: ModeViewMovieList.values[state.data ?? 0]),
        child: BlocBuilder<SettingAppBloc, SettingAppState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: const Text('The Movie'),
              actions: state.appBarAction,
            ),
            body: navigationShell,
            drawer: const DrawerMenu(),
            bottomNavigationBar: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: BottomNavigationBar(
                items: getBottomNavigationBarItems(),
                onTap: _goBranch,
                currentIndex: navigationShell.currentIndex,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Screens.movieList.iconData),
          label: Screens.movieList.screenName),
      BottomNavigationBarItem(
          icon: Icon(Screens.favoriteList.iconData),
          label: Screens.favoriteList.screenName),
      BottomNavigationBarItem(
          icon: Icon(Screens.setting.iconData),
          label: Screens.setting.screenName),
      BottomNavigationBarItem(
          icon: Icon(Screens.about.iconData), label: Screens.about.screenName),
    ];
  }
}
