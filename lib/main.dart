import 'package:filmguru/data/api/movies_service.dart';
import 'package:filmguru/feature/movies_list/movies_list_screen.dart';
import 'package:filmguru/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/api/movies_service_local.dart';
import 'generated/l10n.dart';
import 'repository/movies_repository.dart';

void main() {
  final dependencies = AppDependencies();
  return runApp(MyApp(dependencies: dependencies));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dependencies});
  final AppDependencies dependencies;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoviesRepository(MoviesServiceLocal()),
      child: MaterialApp(
        title: 'Filmguru',
        theme: AppTheme.theme,
        home: MoviesListScreen(dependencies: dependencies),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}

class AppDependencies with MoviesDependenciesMixin {
  final MoviesService moviesService = MoviesServiceLocal();
  @override
  late final MoviesRepository moviesRepository =
      MoviesRepository(moviesService);
}
