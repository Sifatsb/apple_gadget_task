import 'package:apple_gadget_task/app/data/constants/app_text_style.dart';
import 'package:apple_gadget_task/app/routes/app_pages.dart';
import 'package:apple_gadget_task/app/utilities/extensions/widget.extensions.dart';
import 'package:apple_gadget_task/app/utilities/widgets/common_widgets/custom_text_form_field.dart';
import 'package:apple_gadget_task/app/utilities/widgets/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.verticalSpacing,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.verticalSpacing,
                  const Text(
                    'Sign in',
                    style: AppTextStyle.styleFont32BlueW600,
                  ),
                  42.verticalSpacing,

                  /// Email Field
                  const Text(
                    'User ID',
                    style: AppTextStyle.primaryTextStyle,
                  ),
                  14.verticalSpacing,
                  CustomTextFormField(
                    controller: controller.userIdTextController,
                    fillColor: Colors.white,
                    focusBorderActive: true,
                    enableBorderActive: true,
                    hintText: "Type user ID here...",
                    textInputType: TextInputType.text,
                  ),
                  28.verticalSpacing,

                  /// Password Field
                  const Text(
                    'Password',
                    style: AppTextStyle.primaryTextStyle,
                  ),
                  14.verticalSpacing,
                  CustomTextFormField(
                    controller: controller.passwordTextController,
                    fillColor: Colors.white,
                    focusBorderActive: true,
                    enableBorderActive: true,
                    obsCureText: true,
                    hintText: "Type password here...",
                    textInputType: TextInputType.text,
                  ),

                  /// Sign in Button
                  28.verticalSpacing,
                  Obx(
                    () => controller.loginLoader.value
                        ? const Center(child: CircularProgressIndicator())
                        : PrimaryButton(
                            height: 54,
                            onTap: () {
                              if (controller.validate()) {
                                controller.getSignIn(
                                  userId: controller.userIdTextController.text,
                                  password:
                                      controller.passwordTextController.text,
                                );
                              }
                            },
                            text: 'Sign in',
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
