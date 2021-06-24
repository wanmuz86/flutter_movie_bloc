part of 'movie_detail_cubit.dart';
@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}
class MoviesLoaded extends MovieDetailState {
  final List<Movie> movies;

  MoviesLoaded({required this.movies});
}