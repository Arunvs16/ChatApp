import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MAinPage extends StatefulWidget {
  const MAinPage({super.key});

  @override
  State<MAinPage> createState() => _MAinPageState();
}

class _MAinPageState extends State<MAinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  HomePage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
