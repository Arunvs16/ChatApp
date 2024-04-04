import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/pages/forgot_pw_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPAgeState();
}

class _LoginPAgeState extends State<LoginPage> {
  //text controllers

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in

  void signIn(BuildContext context) async {
    // auth service
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPAssword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                  'Welcome Back You\'ve been missed!',
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

                //Forgot password

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const ForgotPasswordPage();
                              }),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //sign in button

                MyButton(onTap: () => signIn(context), text: 'Sing In'),

                const SizedBox(height: 50),

                // not a member?  Register Now!

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
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
