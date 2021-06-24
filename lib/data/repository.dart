import 'package:movie_bloc/data/models/movie.dart';
import 'package:movie_bloc/data/network_service.dart';

class Repository {

  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<Movie>> fetchMovies() async {
    final moviesRaw = await networkService.fetchMovies();
    return moviesRaw.map((e) => Movie.fromJson(e)).toList();
  }

}