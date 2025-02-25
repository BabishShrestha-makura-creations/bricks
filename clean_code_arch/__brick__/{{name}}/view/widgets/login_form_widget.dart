import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/{{name}}_controller.dart';
import '../widgets/forgot_password_view.dart';
import 'package:{{project.snakeCase()}}/src/core/config/failure.dart';
import 'package:{{project.snakeCase()}}/src/core/theme/ui_colors.dart';
import 'package:{{project.snakeCase()}}/src/core/util/validators.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/app_style.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/custom_button.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/custom_snackbar.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/custom_textfield.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/spacer.dart';
import '../../view/controllers/{{name.snakeCase()}}_controller.dart';

import '../../domain/model/{{name.snakeCase()}}_status.dart';

class LoginFormWidget extends ConsumerWidget {
  LoginFormWidget({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  final obscureText = StateProvider<bool>((ref) => true);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = TextEditingController();

    final passwordController = TextEditingController();

    ref.listen<{{name.pascalCase()}}State>({{name.camelCase()}}Controller, (previousState, nextState) {
      if (nextState.status == {{name..pascalCase()}}Status.failure) {
        nextState.whenOrNull(
          failure: (failure, status, provider) {
            failure.showErrorWithSnackBar(context);
          },
        );
      }
    }, onError: (err, _) {
      if (err is Failure) {
        err.showErrorWithSnackBar(context);
      }
    });

    return Form(
      key: _formKey,
      child: Column(children: [
        CustomTextFormField(
          controller: usernameController,
          labelText: "Email",
          validator: Validators.emailValidator,
        ),
        const HeightSpacer(spaceHeight: 16),

        Consumer(
          builder: (context, ref, child) {
            return CustomTextFormField(
              controller: passwordController,
              labelText: "Password",
              validator: Validators.requiredFieldValidators,
              obscureText: ref.watch(obscureText),
              suffixIcon: IconButton(
                icon: Icon(
                    ref.read(obscureText.notifier).state
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey),
                onPressed: () {
                  ref.read(obscureText.notifier).state =
                      !ref.read(obscureText.notifier).state;
                },
              ),
            );
          },
        ),
        // add register button
        CustomButton.text(
          onPressed: () {
            context.push(ForgotPasswordView.routeName);
          },
          name: 'Forgot Password?',

          textColor: UIColors.grey,
          // child: Text("Forgot Password?",
          //     style: appStyle(
          //       color: UIColors.grey,
          //       size: 14,
          //       fontWeight: FontWeight.w600,
          //     )),
        ),
        // Login Button
        Consumer(
          builder: (context, ref, child) {
            return CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // context.push('${Wrapper.routeName}');
                  ref
                      .read({{name.camelCase()}}Controller.notifier)
                      .signInWithUsernameAndPassword(
                          email: usernameController.text.trim(),
                          password: passwordController.text.trim());
                } else {
                  MotionToastHelper.showToast(
                      text: 'Login Unsuccessful',
                      context: context,
                      state: MotionToastState.error);

                  return;
                }
              },
              name: 'Login',
              isLoading: ref.watch({{name.camelCase()}}Controller).maybeWhen(
                  authenticating: (_, __) => true, orElse: () => false),
            );
          },
        ),
        const HeightSpacer(spaceHeight: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account yet? ',
              style: appStyle(
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
