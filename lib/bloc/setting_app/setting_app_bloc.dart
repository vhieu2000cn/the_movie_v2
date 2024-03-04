import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_v2/bloc/setting_app/setting_app_event.dart';
import 'package:the_movie_v2/bloc/setting_app/setting_app_state.dart';
import 'package:the_movie_v2/commons/setting_app_share_preferences.dart';

class SettingAppBloc extends Bloc<SettingAppEvent, SettingAppState> {
  SettingAppBloc({required ModeViewMovieList modeViewMovieList})
      : super(SettingAppState(modeViewMovieList: modeViewMovieList)) {
    on<ChangeTitleAppbarEvent>(_changeTitleAppbar);
    on<ChangeActionAppbarEvent>(_changeActionAppbar);
    on<ChangeModeViewEvent>(_changeModeView);
  }

  FutureOr<void> _changeTitleAppbar(ChangeTitleAppbarEvent event, emit) {
    emit(state.copyWith(appBarTitle: event.title));
  }

  FutureOr<void> _changeActionAppbar(ChangeActionAppbarEvent event, emit) {
    emit(state.copyWith(appBarAction: event.action));
  }

  FutureOr<void> _changeModeView(ChangeModeViewEvent event, emit) {
    emit(state.copyWith(
        appBarTitle: event.indexAction.toString(),
        modeViewMovieList: ModeViewMovieList.values[event.indexAction]));
  }

  @override
  Future<void> close() {
    SettingAppSharePreferences.setModeView(state.modeViewMovieList.index);
    return super.close();
  }
}
