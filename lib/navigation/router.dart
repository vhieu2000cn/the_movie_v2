import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_v2/navigation/configs.dart';
import 'package:the_movie_v2/widgets/bottom_navigation_bar.dart';

final router = GoRouter(
  initialLocation: Screens.movieList.router,
  routes: [
    StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                path: Screens.movieList.router,
                builder: (context, state) => Screens.movieList.screen,
                routes: [
                  GoRoute(
                      path: Screens.movieDetail.router,
                      pageBuilder: (context, state) => NoTransitionPage(
                            child: Screens.movieDetail.screen))
                ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: Screens.favoriteList.router,
                builder: (context, state) => Screens.favoriteList.screen),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: Screens.setting.router,
                builder: (context, state) => Screens.setting.screen),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: Screens.about.router,
                builder: (context, state) => Screens.about.screen),
          ])
        ],
        pageBuilder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) =>
            MaterialPage(
                child: ScaffoldWithNestedNavigation(
                    navigationShell: navigationShell)))
  ],
);
