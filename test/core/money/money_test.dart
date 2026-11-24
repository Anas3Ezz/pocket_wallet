import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_wallet/core/money/money.dart';

void main() {
  group('Money', () {
    test('adds 0.10 and 0.20 to exactly 0.30', () {
      final a = Money.parse('0.10');
      final b = Money.parse('0.20');

      expect(a + b, Money.parse('0.30'));
    });

    test('5 equals 5.00', () {
      expect(Money.parse('5'), Money.parse('5.00'));
    });

    test('5 does not equal 6', () {
      expect(Money.parse('5'), isNot(Money.parse('6')));
    });

    test('equal amounts have the same hashCode', () {
      final a = Money.parse('5.00');
      final b = Money.parse('5');

      expect(a.hashCode, b.hashCode);
    });
  });
}
