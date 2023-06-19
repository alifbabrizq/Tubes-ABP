import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  //TODO: Implement UpdateProfileController
  RxBool isLoading = false.obs;
  TextEditingController nipC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateProfile(String uid) async {
    if (nipC.text.isNotEmpty &&
        nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await firestore.collection("pegawai").doc(uid).update({
          "name": nameC.text,
        });
        Get.snackbar("Success", "Successfully updated profile");
      } catch (e) {
        Get.snackbar("Failed", "Unable to update profile");
      } finally {
        isLoading.value = true;
      }
    }
  }
}
