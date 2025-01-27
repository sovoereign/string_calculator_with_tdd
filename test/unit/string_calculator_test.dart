import 'package:farhana_string_addition_test/domain/string_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator test', () {
    test('value should start at 0', () {
      expect(StringCalculator().add('1,2,3'), 6);
    });

    test('value should start at 0', () {
      expect(StringCalculator().add('//;\n1;2'), 3);
    });

    test('value should start at 0', () {
      expect(StringCalculator().add('//[***]\n1***2***3'), 6);
    });

    test('value should start at 0', () {
      expect(StringCalculator().add('//[*][%]\n1*2%4'), 7);
    });

    test('value should start at 0', () {
      expect(StringCalculator().add('//;\n1;2'), 3);
    });

    test('value should start at 0', () {
      expect(StringCalculator().add('1\n2,5'), 8);
    });

    // if number is negative it will return -1
    test('value should start at 0', () {
      expect(StringCalculator().add('//;\n1;-2'), -1);
    });
    test('value should start at 0', () {
      expect(StringCalculator().add('//;\n1;1002'), 1);
    });

  });
}
