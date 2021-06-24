import 'package:movie_bloc/data/repository.dart';
import 'package:movie_bloc/data/models/movie.dart';
import 'package:movie_bloc/cubit/movie_cubit.dart';
import 'package:movie_bloc/data/repository.dart';
import 'package:movie_bloc/data/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/presentation/screens/movie_screen.dart';
import 'package:movie_bloc/presentation/screens/movie_detail.dart';

class AppRouter {
  late Repository repository;
  late MovieCubit movieCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    movieCubit = MovieCubit(repository: repository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: movieCubit,
            child: MovieScreen(),
          ),
        );
      // case "/detail":
      //   final movie = settings.arguments as Movie;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => MovieDetailCubit(
      //         repository: repository,
      //       ),
      //       child: MovieDetail(movie: movie,),
      //     ),
      //   );
      default:
        return null;
    }
  }
}

