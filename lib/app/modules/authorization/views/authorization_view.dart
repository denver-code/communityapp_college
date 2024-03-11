import 'package:community_app/app/components/hex_to_color.dart';
import 'package:community_app/app/components/imageless_button.dart';
import 'package:community_app/app/components/input_field.dart';
import 'package:community_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authorization_controller.dart';

class AuthorizationView extends GetView<AuthorizationController> {
  const AuthorizationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Lets Get Started',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomInputField(
                helpText: "Enter Your Email",
                icon: const Icon(Icons.email_outlined),
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomInputField(
                helpText: "Enter Your Password",
                icon: const Icon(Icons.lock_outline),
                controller: TextEditingController(),
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              ImagelessSecondaryButton(
                text: "Sign in!",
                onPressed: () {
                  Get.offAndToNamed(Routes.HOME);
                },
                color: HexColor.fromHex("#D75351"),
                borderColor: HexColor.fromHex("#D75351"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
