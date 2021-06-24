import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/cubit/movie_cubit.dart';
import 'package:movie_bloc/data/models/movie.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieCubit>(context).fetchMovies();

    return Scaffold(
        appBar: AppBar(
          title: Text("Todos"),
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/add"),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (!(state is MoviesLoaded))
              return Center(child: CircularProgressIndicator());

            final movies = (state as MoviesLoaded).movies;

            return SingleChildScrollView(
              child: Column(
                children: movies.map((e) => _movies(e, context)).toList(),
              ),
            );
          },
        ));
  }

  Widget _movies(Movie movie, context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/detail", arguments: movie),
      child: _todoTile(movie, context),


    );
  }

  Widget _todoTile(Movie movie, context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(movie.title),

        ],
      ),
    );
  }
}
