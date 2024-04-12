import 'package:chat_app/services/auth/auth_service.dart';
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
    // password dont match -> tell user to fix

    else{
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text("Password Doesn't match",textAlign: TextAlign.center,),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo

                Icon(
                  Icons.message,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                //welcome back message
                Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary
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
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child:  Text(
                        'Login Now!',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),
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
