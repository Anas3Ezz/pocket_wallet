import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_wallet/core/money/money.dart';

void main() {
  group('Money', () {
    test('adds 0.10 and 0.20 to exactly 0.30', () {
      final a = Money.parse('0.10');
      final b = Money.parse('0.20');

      expect(a + b, Money.parse('0.30'));
    });

    test('equal amounts have the same hashCode', () {
      final a = Money.parse('5.00');
      final b = Money.parse('5');

      expect(a.hashCode, b.hashCode);
    });
  });
}
