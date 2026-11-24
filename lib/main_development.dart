import 'package:pocket_wallet/app/app.dart';
import 'package:pocket_wallet/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
