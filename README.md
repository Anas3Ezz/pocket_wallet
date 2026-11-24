# Pocket Wallet

A Flutter fintech wallet app: check your balance, view transactions, and send money.
Built with Cubit/Bloc and clean architecture. Product docs live in [docs/](docs/).

## Run

```sh
flutter run --flavor development --target lib/main_development.dart
```

Other flavors: `staging` (`lib/main_staging.dart`) and `production` (`lib/main_production.dart`).

## Test

```sh
flutter test --coverage
```

The coverage report is written to `coverage/lcov.info`.

## Branch strategy

- `main` is protected. Never commit to it directly.
- Work on a branch: `feat/`, `fix/`, `docs/`, or `chore/`.
- Every change goes through a pull request.
- CI (analyze, tests, spell check, license check, PR title) must pass before merge.

## Commits

Follow [Conventional Commits](https://www.conventionalcommits.org/): `type: short description`.

- Types: `feat`, `fix`, `docs`, `test`, `chore`, `ci`, `refactor`.
- Lowercase, imperative mood, no period: `feat: add money type`.
- Keep commits small: one logical change each.
- PR titles follow the same format.
