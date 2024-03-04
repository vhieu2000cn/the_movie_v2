import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_v2/bloc/movie_list/movie_list_bloc.dart';
import 'package:the_movie_v2/bloc/setting_app/setting_app_bloc.dart';
import 'package:the_movie_v2/bloc/setting_app/setting_app_event.dart';
import 'package:the_movie_v2/bloc/setting_app/setting_app_state.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<SettingAppBloc>()
        .add( const ChangeActionAppbarEvent(action: [ActionMovieList()]));
    return Center(
      child: BlocBuilder<SettingAppBloc, SettingAppState>(
        builder: (context, state) {
          return Text(state.modeViewMovieList.name);
        },
      ),
    );
  }
}

class ActionMovieList extends StatelessWidget {
  const ActionMovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingAppBloc, SettingAppState>(
      builder: (context, state) {
        return ToggleButtons(
            isSelected: ModeViewMovieList.values
                .map((e) => e == state.modeViewMovieList)
                .toList(),
            selectedColor: Colors.deepPurpleAccent,
            onPressed: (index) {
              context.read<SettingAppBloc>().add(  ChangeModeViewEvent(indexAction: index));
            },
            children: const [
              Icon(Icons.view_agenda_rounded),
              Icon(Icons.view_column)
            ]);
      },
    );
  }
}
