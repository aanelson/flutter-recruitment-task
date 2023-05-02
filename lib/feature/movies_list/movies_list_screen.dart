import 'package:filmguru/feature/movies_list/bloc/movie_list_state.dart';
import 'package:filmguru/feature/movies_list/widgets/movie_item_row.dart';
import 'package:filmguru/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/movies_service.dart';
import '../../repository/movies_repository.dart';
import 'bloc/movie_list_bloc.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({
    super.key,
    required this.dependencies,
  });
  final MoviesDependencies dependencies;
  @override
  Widget build(BuildContext context) => BlocProvider(
      create: dependencies.createBloc,
      child: const _MoviesListScreen(
        key: Key('MovieListScreenKey'),
      ));
}

class _MoviesListScreen extends StatelessWidget {
  const _MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mainAppBarTitle),
      ),
      body: Builder(builder: (context) {
        final movies =
            context.selectMovieList((value) => value.state.movieItem);
        final status =
            context.selectMovieList((value) => value.state.loadState);
        return Scrollbar(
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (status == Loadstate.error) {
                return const Text(
                  'error',
                  key: Key('error'),
                );
              } else if (movies.isEmpty) {
                return const Text(
                  'no movies',
                  key: Key('no_movies'),
                );
              }
              final movie = movies[index];
              return MovieItemRow(movie);
            },
            itemCount: movies.isNotEmpty ? movies.length : 1,
          ),
        );
      }),
    );
  }
}

abstract class MoviesDependencies {
  MovieListCubit createBloc(BuildContext context);
}

mixin MoviesDependenciesMixin implements MoviesDependencies {
  MoviesService get moviesService;

  late final MoviesRepository moviesRepository =
      MoviesRepository(moviesService);

  @override
  MovieListCubit createBloc(BuildContext context) =>
      MovieListCubitImpl(moviesRepository)..requestMovies();
}
