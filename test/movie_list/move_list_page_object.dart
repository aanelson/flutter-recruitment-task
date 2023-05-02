import 'package:filmguru/feature/movies_list/widgets/movie_item_row.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:page_object/page_object.dart';

final movieListPageObject = MovieListPageObject();

class MovieListPageObject extends PageObject {
  MovieListPageObject() : super(find.byKey(const Key('MovieListScreenKey')));
  Finder get noMovies => find.byKey(const Key('no_movies'));
  Finder get hasMovies => find.byType(MovieItemRow);
  Finder get error => find.byKey(const Key('error'));
}
