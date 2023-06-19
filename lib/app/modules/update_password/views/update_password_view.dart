import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  const UpdatePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xff090580),
        title: const Text('UPDATE PASSWORD'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.currC,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Current Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.newC,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "New Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.confirmC,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Confirm New Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff090580)),
              ),
              onPressed: () {
                if (controller.isLoading.isFalse) {
                  controller.updatePass();
                }
              },
              child: Text((controller.isLoading.isFalse)
                  ? "CHANGE PASSWORD"
                  : "LOADING..."),
            ),
          ),
        ],
      ),
    );
  }
}
