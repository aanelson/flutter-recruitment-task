import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/movie_item.dart';

part 'movie_list_state.freezed.dart';

enum Loadstate { error, loading, loaded, notRequested }

@freezed
class MovieListCubitState with _$MovieListCubitState {
  factory MovieListCubitState(
      {required List<MovieItem> movieItem,
      required Loadstate loadState}) = _MovieListCubitState;
}
