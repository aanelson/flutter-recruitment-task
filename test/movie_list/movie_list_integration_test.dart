import 'dart:async';

import 'package:filmguru/data/api/model/movie_item_response.dart';
import 'package:filmguru/data/api/movies_service.dart';
import 'package:filmguru/data/api/movies_service_local.dart';
import 'package:filmguru/feature/movies_list/movies_list_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_harness/widget_test_harness.dart';

import '../common_widget_setup.dart';
import 'move_list_page_object.dart';

void main() {
  testWidgets('displays items', integrationHarness((given, when, then) async {
    await given.pumpMoviesListScreen();
    await when.moviesRequestReturns();
    then.findsOneWidget(movieListPageObject);
    then.findsAtLeastOneWidget(movieListPageObject.hasMovies);
  }));
  testWidgets('Shows no items while loading',
      integrationHarness((given, when, then) async {
    await given.pumpMoviesListScreen();
    then.findsNothing(movieListPageObject.hasMovies);
    then.findsOneWidget(movieListPageObject.noMovies);
  }));
  testWidgets('Shows no movies if request errors',
      integrationHarness((given, when, then) async {
    await given.pumpMoviesListScreen();
    await when.moviesRequestErrors();
    then.findsNothing(movieListPageObject.hasMovies);
    then.findsOneWidget(movieListPageObject.error);
  }));
}

final integrationHarness =
    HarnessSetup.setupWidgetHarness(MovieListIntegrtionHarness.new);

class MovieListIntegrtionHarness extends WidgetTestHarness
    with MoviesDependenciesMixin, CommonWidgetSetup, NetworkImageMixin {
  MovieListIntegrtionHarness(super.tester);

  @override
  final FakeMovieService moviesService = FakeMovieService();
}

extension MoviesIntegrationGiven on Given<MovieListIntegrtionHarness> {
  Future<void> pumpMoviesListScreen() {
    return pumpWidget(harness.setupWidgetTree(MoviesListScreen(
      dependencies: harness,
    )));
  }
}

extension MoviesIntegrationWhen on When<MovieListIntegrtionHarness> {
  Future<void> moviesRequestReturns() async {
    harness.moviesService.getMovieResponse.last
        .complete(MoviesServiceLocal().getMovies());
    await pump();
  }

  Future<void> moviesRequestErrors([Object error = 'error']) async {
    harness.moviesService.getMovieResponse.last.completeError(error);
    await pump();
    await pump();
  }
}

extension MoviesIntegrationThen on Then<MovieListIntegrtionHarness> {}

class FakeMovieService implements MoviesService {
  List<Completer<List<MovieItemResponse>>> getMovieResponse = [];
  @override
  Future<List<MovieItemResponse>> getMovies() {
    getMovieResponse.add(Completer());
    return getMovieResponse.last.future;
  }
}
