import 'package:filmguru/data/api/model/movie_item_response.dart';
import 'package:filmguru/data/api/movies_service_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_harness/widget_test_harness.dart';

void main() {
  test('maps results', harness((given, when, then) async {
    await when.makeListRequest();
    then.responseIs(hasLength(20));
  }));
}

final harness = HarnessSetup.setupHarness(NetworkHarness.new);

class NetworkHarness extends UnitTestHarness {
  NetworkHarness() {
    WidgetsFlutterBinding.ensureInitialized();
  }
  final service = MoviesServiceLocal();
  List<MovieItemResponse>? _listResponse;
}

extension on When<NetworkHarness> {
  Future<void> makeListRequest() async {
    this.harness._listResponse = await this.harness.service.getMovies();
  }
}

extension on Then<NetworkHarness> {
  void responseIs(dynamic matcher) =>
      expect(this.harness._listResponse, matcher);
}
