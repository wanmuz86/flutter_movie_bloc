part of 'movie_cubit.dart';
@immutable
abstract class MovieState {}

class MoviesInitial extends MovieState {}
class MoviesLoaded extends MovieState {
  final List<Movie> movies;

  MoviesLoaded({required this.movies});
}