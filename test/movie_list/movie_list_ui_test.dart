import 'package:filmguru/data/model/movie_item.dart';
import 'package:filmguru/feature/movies_list/bloc/movie_list_bloc.dart';
import 'package:filmguru/feature/movies_list/bloc/movie_list_state.dart';
import 'package:filmguru/feature/movies_list/movies_list_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_test_harness/widget_test_harness.dart';

import '../common_widget_setup.dart';
import 'move_list_page_object.dart';

void main() {
  testWidgets('should display correctly', uiHarness((given, when, then) async {
    await given.pumpMoviesListScreen();
    await when.stateChangesTo(
      MovieListCubitState(
          movieItem: [MovieItem(title: 'hi', poster: 'some poster')],
          loadState: Loadstate.error),
    );
    then.findsOneWidget(movieListPageObject.error);
  }));
  testWidgets('Should display list of items',
      uiHarness((given, when, then) async {
    await given.pumpMoviesListScreen();
    await when.stateChangesTo(MovieListCubitState(
        movieItem: someMovies, loadState: Loadstate.loaded));
    then.findsAtLeastOneWidget(movieListPageObject.hasMovies);
    then.findsNothing(movieListPageObject.error);
    then.findsNothing(movieListPageObject.noMovies);
  }));
  testWidgets('Should show no items before loading',
      uiHarness((given, when, then) async {
    await given.pumpMoviesListScreen();
    then.findsNothing(movieListPageObject.hasMovies);
    then.findsOneWidget(movieListPageObject.noMovies);
  }));
}

final someMovies = [
  MovieItem(title: 'hi', poster: 'some poster'),
  MovieItem(title: 'bye', poster: 'another poster')
];

final uiHarness = HarnessSetup.setupWidgetHarness(MovieListUIHarness.new);

class MovieListUIHarness extends WidgetTestHarness
    with CommonWidgetSetup, NetworkImageMixin
    implements MoviesDependencies {
  MovieListUIHarness(super.tester);
  late final MockMovieListCubit cubit = MockMovieListCubit();
  @override
  MovieListCubit createBloc(BuildContext context) => cubit;
}

extension on When<MovieListUIHarness> {
  Future<void> stateChangesTo(MovieListCubitState state) async {
    harness.cubit.emit(state);
    await pump();
  }
}

extension MoviesIntegrationGiven on Given<MovieListUIHarness> {
  Future<void> pumpMoviesListScreen() {
    return pumpWidget(harness.setupWidgetTree(MoviesListScreen(
      dependencies: harness,
    )));
  }
}

class MockMovieListCubit extends MovieListCubit {
  MockMovieListCubit()
      : super(MovieListCubitState(
            movieItem: [], loadState: Loadstate.notRequested));

  @override
  Future<void> requestMovies() async {}
}
