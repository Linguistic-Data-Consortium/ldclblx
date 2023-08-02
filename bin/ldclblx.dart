import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;
import 'package:ldclblx/ldclblx.dart' as ldclblx;

const lineNumber = 'line-number';

void main(List<String> arguments) {
  // print('Hello world: ${ldclblx.calculate()}!');
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n');
  ArgResults argResults = parser.parse(arguments);
  final fns = argResults.rest;
  final f = File(fns[0]);
  if (f.existsSync()) {
    var type = whichFormat(fns[0]);
    var out = File(fns[1]);
    switch (type) {
      case 'tsv':
        out.writeAsStringSync(ldclblx.tsv(f.readAsLinesSync()));
    }
  } else {
    stdout.writeln("file doesn't exist");
  }
}

// Future<void> _handleError(String path) async {
//   if (await FileSystemEntity.isDirectory(path)) {
//     stderr.writeln('error: $path is a directory');
//   } else {
//     exitCode = 2;
//   }
// }

String whichFormat(fn) {
  final ext = p.extension(fn);
  if (ext == '.tsv') {
    return 'tsv';
  } else {
    return 'none';
  }
}
