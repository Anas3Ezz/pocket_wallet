import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

/// An exact amount of money, stored as [amount].
///
/// Never use a `double` for money: `0.1 + 0.2` is `0.30000000000000004`.
@immutable
class const Money(final Decimal amount) {
  /// Creates money from a string such as `'12.50'`.
  ///
  /// Throws a [FormatException] if [value] is not a valid number.
  factory parse(String value) => Money(Decimal.parse(value));

  /// Returns the sum of this and [other].
  Money operator +(Money other) => Money(amount + other.amount);

  @override
  bool operator ==(Object other) => other is Money && other.amount == amount;

  @override
  int get hashCode => amount.hashCode;
}
