import 'package:flutter/material.dart';
import 'package:presence_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SizedBox(height: 150,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Login👋", style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold, 
                  color: Color(0xff090580) ),),
              ),
            ],
          ),
          SizedBox(height: 30,),
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
          TextField(
            autocorrect: false,
            controller: controller.passC,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
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
              ),

              onPressed: () async {
                if (controller.isLoading.isFalse) {
                  await controller.login();
                }
              },
              child:
                  Text(controller.isLoading.isFalse ? "LOGIN" : "LOADING..."),
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
            child: Text("Lupa password ?", style: TextStyle(color: Colors.grey),),
          ),
        ],
      ),
    );
  }
}
