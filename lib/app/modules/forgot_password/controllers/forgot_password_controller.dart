import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void sendEmail() async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);

        Get.snackbar("Success",
            "We have sent a password reset email. Check your e-mail.");
        Get.back();
      } catch (e) {
        Get.snackbar(
            "Something Wrong!", "Unable to send password reset email.");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
