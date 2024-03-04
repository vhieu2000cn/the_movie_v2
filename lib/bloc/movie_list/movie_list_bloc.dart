import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_v2/bloc/movie_list/movie_list_event.dart';
import 'package:the_movie_v2/bloc/movie_list/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListState());


}
