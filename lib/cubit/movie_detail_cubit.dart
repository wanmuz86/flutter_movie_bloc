import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc/data/models/movie.dart';
import 'package:movie_bloc/data/repository.dart';


part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final Repository repository;

  MovieDetailCubit({required this.repository}) : super(MovieDetailInitial());


  void fetchMovieDetail() {
    Timer(Duration(seconds: 3), () {
      repository.fetchMovies().then((movies) {
        emit(MoviesLoaded(movies: movies));
      });
    });
  }

}