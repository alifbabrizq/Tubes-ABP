import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff090580),
        title: const Text('FORGOT PASSWORD'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            autocorrect: false,
            controller: controller.emailC,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff090580)),
              ),              onPressed: () {
                if (controller.isLoading.isFalse) {
                  controller.sendEmail();
                }
              },
              child: Text(controller.isLoading.isFalse
                  ? "SEND RESET PASSWORD"
                  : "LOADING..."),
            ),
          ),
        ],
      ),
    );
  }
}
