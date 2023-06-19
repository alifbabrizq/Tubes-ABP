import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController currC = TextEditingController();
  TextEditingController newC = TextEditingController();
  TextEditingController confirmC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePass() async {
    if (currC.text.isNotEmpty &&
        newC.text.isNotEmpty &&
        confirmC.text.isNotEmpty) {
      if (newC.text == confirmC.text) {
        isLoading.value = true;
        try {
          String emailUser = auth.currentUser!.email!;

          await auth.signInWithEmailAndPassword(
              email: emailUser, password: currC.text);

          await auth.currentUser!.updatePassword(newC.text);

          Get.back();

          Get.snackbar("Success", "password successfully updated");
        } on FirebaseAuthException catch (e) {
          if (e.code == "wrong-password") {
            Get.snackbar("Something Wrong!",
                "The password entered is incorrect. Failed to update the password");
          } else {
            Get.snackbar("Something Wrong!", e.code.toLowerCase());
          }
        } catch (e) {
          Get.snackbar("Something Wrong!", "update password failed");
        } finally {
          isLoading.value = false;
        }
      } else {
        Get.snackbar(
            "Something Wrong!", "password confirmation does not match.");
      }
    } else {
      Get.snackbar("Something Wrong!", "all fields must be filled in.");
    }
  }
}
