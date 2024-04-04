import 'package:chat_app/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // sign Up

  void signUp() {
    final auth = AuthService();

    // password match ->create user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        auth.signUpWithEmailAndPAssword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo

                const Icon(
                  Icons.message,
                  size: 80,
                ),

                //welcome back message
                const Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield

                MyTextField(
                  controller: emailController,
                  hintext: 'Email',
                  obscuretext: false,
                ),

                const SizedBox(height: 10),

                //Password textfield

                MyTextField(
                  controller: passwordController,
                  hintext: 'Password',
                  obscuretext: true,
                ),

                const SizedBox(height: 10),

                // confirm password testfield

                MyTextField(
                  controller: confirmPasswordController,
                  hintext: 'Confirm Password',
                  obscuretext: true,
                ),

                const SizedBox(height: 25),

                //sign un button

                MyButton(onTap: signUp, text: 'Sing Up'),

                const SizedBox(height: 50),

                // not a member?  Register Now!

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
