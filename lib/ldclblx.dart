import 'dart:io';
import 'dart:convert';

String tsv(x) {
  final lines = x; //utf8.decoder.bind(x).transform(const LineSplitter());
  String header1 = '''File type = "ooTextFile"
Object class = "TextGrid"
0
''';
  String header2 = '''<exists>
1
"IntervalTier"
"segment"
0
''';
  // print(out);
  String out = "";

  String header3 = "";
  var first = lines[1].split("\t");
  String last = '';
  if (double.parse(first[2]) > 0) {
    header3 = "${lines.length + 2}\n";
    last = '0';
  } else {
    header3 = "${lines.length + 1}\n";
  }
  List a = [];
  for (final line in lines.sublist(1)) {
    a = line.split("\t");
    if (double.parse(first[2]) > 0) {
      out = "$out$last\n${a[2]}\n\"\"\n";
    }
    out = "$out${a[2]}\n${a[3]}\n\"${a[4]}\"\n";
    last = a[3];
  }
  var end = (double.parse(a[3]) + 1.0).toString();
  out = "$header1$end\n$header2$end\n$header3$out${a[3]}\n$end\n\"\"\n";
  return out;
}
