import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/app_button.dart';
import 'package:chat_app/components/app_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  void register(BuildContext context) {
    //get auth service
    final _auth = AuthServcie();

    //password match create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords Don't Match"),
              ));
    }
  }

  RegisterPage({super.key, this.onTap});

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
              "Let's Create an Account for You",
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
              height: 10,
            ),

            AppTextFeild(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
            ),

            SizedBox(
              height: 25,
            ),
            //login button

            AppButton(
              text: "Register",
              onTap: () => register(context),
            ),

            SizedBox(
              height: 25,
            ),

            //register button

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
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
