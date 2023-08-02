import 'package:ldclblx/ldclblx.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(
        tsv([
          "Kit\tAudio\tBeg\tEnd\tSpeaker\tSection\n",
          "x\ty\t1.0\t2.0\tsegment\tspeaker\tsection\n"
        ]),
        '''File type = "ooTextFile"
Object class = "TextGrid"
0
3.0
<exists>
1
"IntervalTier"
"segment"
0
3.0
3
0
1.0
""
1.0
2.0
"segment"
2.0
3.0
""
''');
  });
}
