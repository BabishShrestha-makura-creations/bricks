import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project.snakeCase()}}/main.dart';
import 'package:{{project.snakeCase()}}/src/core/app/application/app_controller.dart';
import 'package:{{project.snakeCase()}}/src/core/app/infrastructure/app_state.dart';
import 'package:{{project.snakeCase()}}/src/core/config/failure.dart';
import 'package:{{project.snakeCase()}}/src/core/extension/exception_extension.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/custom_snackbar.dart';
import '../../domain/model/{{name.snakeCase()}}.dart';

// import 'package:hive/hive.dart';

import '../../data/{{name}}_repo.dart';
import '../../domain/model/{{name}}_status.dart';

//! not working . state updates but doesnt show in app router. returns false.
// final isAuthenticated = StateProvider<bool>((ref) => false);
{{name}}Controller = StateNotifierProvider<{{name.pascalCase()}}Notifier, {{name.pascalCase()}}State>(
  (ref) => {{name.pascalCase()}}Notifier(
    {{name.camelCase()}}Repository: ref.read({{name.camelCase()}}Provider),
    ref: ref,
    // settingsRepo: ref.read(settingsRepoProvider)
  ),
);
 

class {{name.pascalCase()}}Notifier extends StateNotifier<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Notifier(
      {required {{name.pascalCase()}}RepositoryImpl {{name.camelCase()}}Repository,
      // required SettingsRepo settingsRepo,
      required Ref ref})
      : _{{name.camelCase()}}Repository = {{name.camelCase()}}Repository,
        // _settingsRepo = settingsRepo,
        _ref = ref,
        super(const {{name.pascalCase()}}State.initial());

  final {{name.pascalCase()}}RepositoryImpl _{{name.camelCase()}}Repository;
  // final SettingsRepo _settingsRepo;
  final Ref _ref;
  DateTime? tokenExpirationTime;
  late String email;
  late String password;

  get buildContext => navigatorKey.currentState!.context;

  Future<void> signInWithUsernameAndPassword({
    required String email,
    required String password,
  }) async {
    this.email = email;
    this.password = password;
    state = const {{name.pascalCase()}}State.authenticating();

    try {
      final user =
          await _{{name.camelCase()}}Repository.signInWithEmailAndPassword(email, password);

      // If authentication is successful
      // if (user != null) {
      // Update app state
      _ref
          .read(appNotifierProvider.notifier)
          .updateAppState(const AppState.authenticated());

      state = const {{name.pascalCase()}}State.authenticated(status: {{name.pascalCase()}}Status.success);
      // } else {
      //   throw Exception("Authentication failed, user is null");
      // }
    } on DioException catch (e) {
      final networkException = e.toFailure();
      state = {{name.pascalCase()}}State.failure(networkException, status: {{name.pascalCase()}}Status.failure);
    } catch (e) {
      state = {{name.pascalCase()}}State.failure(Failure.fromException(e),
          status: {{name.pascalCase()}}Status.failure);
    }
  }
 
 

  Future<{{name.pascalCase()}}> getEmailAndPassword() async {
    throw UnimplementedError();
    // final box = await Hive.openLazyBox<Auth>(HiveBox.authCredentialBox);
    // if (box.isEmpty) {
    //   return const Auth(
    //     email: '',
    //     password: '',
    //   );
    // }
    // final data = await box.get('authCredential');

    // return data ??
    //     const Auth(
    //       email: '',
    //       password: '',
    //     );
  }
 
}
