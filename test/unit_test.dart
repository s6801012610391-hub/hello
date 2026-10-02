import 'package:flutter_test/flutter_test.dart';
import 'package:hello/rock_paper_scissors.dart';

void main() {
    test('paper and rock', () {
      String result1 = calResult(Pick.paper, Pick.rock);
      expect(result1, 'Player 1 won');
    });

    test('Tie', () {
      String result2 = calResult(Pick.scissors, Pick.scissors);
      expect(result2, 'Tie');
    });

    test('paper and scissors', () {
      String result3 = calResult(Pick.paper, Pick.scissors);
      expect(result3, 'Player 2 won');
    });

    test('pick nothing', () {
      String result4 = calResult(Pick.nothing, Pick.nothing);
      expect(result4, 'nothing');
    });
}