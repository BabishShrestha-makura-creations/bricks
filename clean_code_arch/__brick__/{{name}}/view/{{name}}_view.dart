import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seed_lms_app/src/core/config/failure.dart';
import 'package:seed_lms_app/src/core/theme/ui_colors.dart';
import 'package:seed_lms_app/src/core/util/validators.dart';
import 'package:seed_lms_app/src/core/widgets/app_style.dart';
import 'package:seed_lms_app/src/core/widgets/custom_button.dart';
import 'package:seed_lms_app/src/core/widgets/custom_snackbar.dart';
import 'package:seed_lms_app/src/core/widgets/custom_textfield.dart';
import 'package:seed_lms_app/src/core/widgets/spacer.dart';
import 'package:seed_lms_app/src/features/authentication/domain/model/auth_status.dart';
import 'package:seed_lms_app/src/features/authentication/view/controllers/auth_controller.dart';
import 'package:seed_lms_app/src/features/authentication/view/widgets/forgot_password_view.dart';
import 'package:seed_lms_app/src/features/wrapper.dart';

import 'widgets/{{name}}_widgets.dart';
 

class {{name.pascalCase()}}View extends StatelessWidget {
  const String routeName = '/{{name.pascalCase()}}';

  const {{name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Logo
              const HeightSpacer(spaceHeight: 20),

              const HeightSpacer(spaceHeight: 20),
              //  Login Card
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: appStyle(
                  size: 24,
                  color: UIColors.kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const HeightSpacer(spaceHeight: 12),
              Text(
                'Please enter your details to login',
                textAlign: TextAlign.center,
                style: appStyle(
                  color: UIColors.grey,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const HeightSpacer(spaceHeight: 28),
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
