import 'package:filmguru/generated/l10n.dart';
import 'package:filmguru/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_harness/widget_test_harness.dart';

mixin CommonWidgetSetup on WidgetTestHarness {
  @override
  Widget setupWidgetTree(Widget child) {
    return super.setupWidgetTree(MaterialApp(
      title: 'Filmguru',
      theme: AppTheme.theme,
      home: child,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    ));
  }
}

extension CommonWidgetThen on Then<CommonWidgetSetup> {
  void findsAtLeastOneWidget(Finder finder) =>
      expect(finder, findsAtLeastNWidgets(1));
}
