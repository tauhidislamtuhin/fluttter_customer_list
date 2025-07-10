import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());



    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: AppColors.primary
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Email Input Field
                  CustomField(
                    label: 'Email Address',
                    hintText: 'Enter your email address',
                    controller: controller.emailController,
                  ),

                  const SizedBox(height: 15),

                  // Password Input Field
                  Obx(
                        () => CustomField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      isSecured: controller.isSecured.value,
                      controller: controller.passwordController,
                      trailing: IconButton(
                        onPressed: () {
                          controller.isSecured.value =
                          !controller.isSecured.value;
                        },
                        icon: Icon(
                          controller.isSecured.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Login Button
                  Obx(
                        () => CustomButton(
                      label:
                      controller.isLoading.value ? 'Loading...' : 'Log In',
                      onTap: () {
                        final email = controller.emailController.text;
                        final password = controller.passwordController.text;

                        controller.login(email, password);

                        print("Email : $email and Password : $password");
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Register Button
                  TextButton(
                    onPressed: () => Get.to(() => const RegisterScreen()),
                    child: Text(
                      'CREATE A NEW ACCOUNT',
                      style: TextStyle(
                        color: AppColors.primary.withOpacity(.8),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
