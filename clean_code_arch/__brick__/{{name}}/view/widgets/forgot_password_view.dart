import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{project.snakeCase()}}/src/core/util/validators.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/app_style.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/custom_button.dart';
import 'package:{{project.snakeCase()}}/src/core/widgets/custom_textfield.dart';

class ForgotPasswordView extends StatelessWidget {
  static const routeName = '/forgot_password';

  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your email',
              style: appStyle(size: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              labelText: 'Email',
              validator: Validators.emailValidator,
              controller: emailController,
            ),
            const SizedBox(height: 20),
            Consumer(builder: (context, ref, child) {
              return CustomButton(
                onPressed: () {
                  // ref
                  //     .read(authController.notifier)
                  //     .sendPasswordResetEmail(emailController.text);
                },
                name: 'Reset Password',
              );
            }),
          ],
        ),
      ),
    );
  }
}
