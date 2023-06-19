import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_apps/app/routes/app_pages.dart';

class NewPasswordController extends GetxController {
  //TODO: Implement NewPasswordController
  TextEditingController newPassC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void newPassword() async {
    if (newPassC.text.isNotEmpty) {
      if (newPassC.text != "password") {
        try {
          String email = auth.currentUser!.email!;

          await auth.currentUser!.updatePassword(newPassC.text);

          await auth.signOut();

          await auth.signInWithEmailAndPassword(
            email: email,
            password: newPassC.text,
          );

          Get.offAllNamed(Routes.HOME);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar(
                "Something Wrong!", "Password too weak, atleast 6 character");
          }
        } catch (e) {
          Get.snackbar("Something Wrong!", "can't change current password");
        }
      } else {
        Get.snackbar(
            "Something Wrong!", "you can't change the previous password");
      }
    } else {
      Get.snackbar("Something Wrong!", "new password is required");
    }
  }
}
