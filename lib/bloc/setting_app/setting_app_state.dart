import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_v2/commons/setting_app_share_preferences.dart';

enum ModeViewMovieList { listView, cardView }

class SettingAppState extends Equatable {
  final String appBarTitle;
  final List<Widget> appBarAction;

  final ModeViewMovieList modeViewMovieList;

  @override
  List<Object?> get props => [appBarAction, appBarTitle];

  const SettingAppState({this.appBarTitle = "",
    this.appBarAction = const <Widget>[],
    required this.modeViewMovieList});

  SettingAppState copyWith({String? appBarTitle, List<
      Widget>? appBarAction, ModeViewMovieList? modeViewMovieList}) {
    return SettingAppState(
        appBarTitle: appBarTitle ?? this.appBarTitle,
        appBarAction: appBarAction ?? this.appBarAction,
        modeViewMovieList: modeViewMovieList ?? this.modeViewMovieList);
  }
}
