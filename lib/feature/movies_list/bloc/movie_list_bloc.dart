import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/movies_repository.dart';
import 'movie_list_state.dart';

extension MovieListCubitContextExtension on BuildContext {
  T selectMovieList<T>(T Function(MovieListCubit value) selector) =>
      select(selector);
}

abstract class MovieListCubit extends Cubit<MovieListCubitState> {
  MovieListCubit(super.initialState);

  Future<void> requestMovies();
}

class MovieListCubitImpl extends MovieListCubit {
  MovieListCubitImpl(this.moviesRepository)
      : super(MovieListCubitState(
            movieItem: [], loadState: Loadstate.notRequested));
  final MoviesRepository moviesRepository;

  @override
  Future<void> requestMovies() async {
    emit(state.copyWith(loadState: Loadstate.loading));
    try {
      final requestMovies = await moviesRepository.getMovies();
      emit(state.copyWith(
          movieItem: requestMovies, loadState: Loadstate.loaded));
    } catch (e) {
      emit(state.copyWith(
          movieItem: state.movieItem, loadState: Loadstate.error));
    }
  }
}
