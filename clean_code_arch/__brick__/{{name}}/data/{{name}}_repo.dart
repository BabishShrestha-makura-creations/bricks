import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{project}}/src/core/config/dio/dio_client.dart';
import 'package:{{project}}/src/core/config/exception/network_exception/network_exception.dart';
import 'package:{{project}}/src/core/constants/api_constant.dart';
import '../domain/model/{{name.snakeCase()}}.dart';
import 'package:{{project}}/src/features/user/data/user_repo.dart';
// import 'package:hive/hive.dart';

{{name}}Provider = Provider<{{name.pascalCase()}}RepositoryImpl>((ref) =>
    {{name.pascalCase()}}RepositoryImpl(ref: ref, dioHelper: ref.read(dioClientProvider)));
final credentialProvider = StateProvider<String?>((ref) => '');

class {{name.pascalCase()}}RepositoryImpl {
  {{name.pascalCase()}}RepositoryImpl({required Ref ref, required DioClient dioHelper})
      : ref = ref,
        dioHelper = dioHelper;

  final Ref ref;
  final DioClient dioHelper;

  

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await dioHelper.post(ApiConstant.login, data: {
        {
          "email": email,
          "password": password,
        }
      });

      await ref.read(userRepoProvider).getUserDetails(response.data['id']);
      return response.data;
 
    } on NetworkExceptions catch (e) {
      log('NetworkException Auth Error: ${e.errorMessage}');
      throw Exception(e.errorMessage);
    } catch (e) {
      log('Error signing in: $e');
      throw Exception('An unexpected error occurred');
    }
  }
}
