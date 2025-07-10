import 'dart:convert';
import 'dart:io';
import 'package:customer_list/services/login_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/user_model.dart';
import '../views/home/home.dart';


class AuthController extends GetxController {
  RxBool isSecured = RxBool(true);
  RxBool isLoading = RxBool(false);

  var userModel = UserModel().obs;

  var selectedImage = File('').obs;

  final LoginApiService _loginApiService = LoginApiService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      selectedImage.value = File(pickedImage.path);
      update();
      userModel.value.profilePicture = selectedImage.value.path;
    }

  }


  register () async {

  }

  Future<void>login (String username, String password) async {
    isLoading.value = true;

    try {
      final token = await _loginApiService.login(username, password);


      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token); // Save token
        Get.snackbar('Login', 'Login successful. Token saved');
        final _token = prefs.getString('auth_token');
        print("Token : $_token");

        Get.offAll(() => const HomeScreen());
        // Navigate to home/dashboard here if needed
      } else {
        Get.snackbar('Login Failed', 'Invalid credentials or token not found');
      }
    } catch (e) {
      Get.snackbar('Error', 'Login error: $e');
    } finally {
      isLoading.value = false;
    }


  }
}
