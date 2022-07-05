import 'dart:io';

import 'package:collection/collection.dart';
import 'package:path/path.dart';

Future<void> main(List<String> arguments) async {
  final launchDate = DateTime.now().toUtc();

  final path = arguments.firstOrNull ??
      Platform.environment['PATH'] ??
      join('/', 'tmp', 'dvt');

  final dir = Directory(path);
  if (!dir.existsSync()) dir.createSync(recursive: true);
  print('using dir ${dir.path}');

  final fileA = File(join(path, 'file_a.txt'));
  print('writing to ${fileA.path}');
  fileA.writeAsStringSync('A - $launchDate');

  final fileB = File(join(path, 'file_b.txt'));
  print('writing to ${fileB.path}');
  fileB.writeAsStringSync('B - $launchDate');
}
