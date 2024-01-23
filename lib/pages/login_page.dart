import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/app_button.dart';
import 'package:chat_app/components/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email and pw controller

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  //Login Method

  void login(BuildContext context) async {
    //auth service

    final authServcie = AuthServcie();

    //try login
    try {
      await authServcie.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    }

    //catch errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo

            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            //welcome back message

            SizedBox(
              height: 50,
            ),

            Text(
              "Welcome Back, You've Been Missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //email text feild

            AppTextFeild(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            //password

            SizedBox(
              height: 10,
            ),

            AppTextFeild(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            SizedBox(
              height: 25,
            ),
            //login button

            AppButton(
              text: "Login",
              onTap: () => login(context),
            ),

            SizedBox(
              height: 25,
            ),

            //register button

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a Member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
