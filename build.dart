import 'dart:io';

import 'package:editor_build/editor_build.dart';
import 'package:js_wrapping_generator/dart_generator.dart';
import 'package:path/path.dart' as path;

Generator _generator = new Generator('packages');

class Library {
  final String fileName;
  final String directory;
  final String dartConstructorNS;
  Library(this.fileName, this.directory, {this.dartConstructorNS});
}

final LIBS = [
    new Library('google_drive_realtime.dart', 'realtime', dartConstructorNS: 'realtime'),
    new Library('google_drive_realtime_databinding.dart', 'databinding'),
];

main(List<String> args) {
  final buildOptions = BuildOptions.parse(args.isEmpty ? ['--clean', '--full'] : args);
  final template = new Directory('lib-template/src');
  final target = new Directory('lib/src/generated');
  if (buildOptions.clean && target.existsSync()) target.deleteSync(recursive: true);
  if (buildOptions.full) {
    LIBS.forEach((l) {
      _generator
        ..dartConstructorNS = l.dartConstructorNS
        ..transformDirectory(new File(path.join('lib-template', l.fileName)),
          new Directory(path.join(template.path, l.directory)),
          new Directory(path.join(target.path, l.directory)));
    });
  }
  buildOptions.removed
    .where((file) => file.startsWith(template.path))
    .forEach((file) {
      new File(target.path + '/' + path.relative(file, from: template.path)).deleteSync(recursive: true);
    });
//  buildOptions.changed
//    .where((file) => file.startsWith(template.path))
//    .forEach((file) {
//      final targetFile = new File(target.path + '/' + path.relative(file, from: template.path));
//      new Directory(path.dirname(targetFile.path)).createSync(recursive: true);
//      targetFile.createSync();
//      transformFile(new File(file), targetFile);
//    });
}