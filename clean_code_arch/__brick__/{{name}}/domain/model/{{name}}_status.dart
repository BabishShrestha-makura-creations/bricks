// import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/config/failure.dart';

part '{{name.snakeCase()}}_status.freezed.dart';

enum {{name.pascalCase()}}Status { idle, busy, success, failure }

enum {{name.pascalCase()}}Provider { none, email, apple, google, gameService }

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const {{name.pascalCase()}}State._();
  const factory {{name.pascalCase()}}State.initial({
    @Default({{name.pascalCase()}}Status.idle) {{name.pascalCase()}}Status? status,
    @Default({{name.pascalCase()}}Provider.none) {{name.pascalCase()}}Provider? provider,
  }) = _{{name.pascalCase()}}Initial;
  const factory {{name.pascalCase()}}State.authenticating({
    @Default({{name.pascalCase()}}Status.idle) {{name.pascalCase()}}Status? status,
    @Default({{name.pascalCase()}}Provider.none) {{name.pascalCase()}}Provider? provider,
  }) = _{{name.pascalCase()}}Unauthenticated;
  const factory {{name.pascalCase()}}State.authenticated({
    @Default({{name.pascalCase()}}Status.idle) {{name.pascalCase()}}Status? status,
    @Default({{name.pascalCase()}}Provider.none) {{name.pascalCase()}}Provider? provider,
    // required User? user,
  }) = _{{name.pascalCase()}}authenticated;
  const factory {{name.pascalCase()}}State.failure(
    Failure failure, {
    @Default({{name.pascalCase()}}Status.idle) {{name.pascalCase()}}Status? status,
    @Default({{name.pascalCase()}}Provider.none) {{name.pascalCase()}}Provider? provider,
  }) = _{{name.pascalCase()}}Failed;
}
