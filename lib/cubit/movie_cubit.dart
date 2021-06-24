import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc/data/models/movie.dart';
import 'package:movie_bloc/data/repository.dart';


part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final Repository repository;

  MovieCubit({required this.repository}) : super(MoviesInitial());


  void fetchMovies() {
    Timer(Duration(seconds: 3), () {
      repository.fetchMovies().then((movies) {
        emit(MoviesLoaded(movies: movies));
      });
    });
  }

}