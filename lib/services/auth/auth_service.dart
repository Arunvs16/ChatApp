import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of auth

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sign user in
  Future<UserCredential> signInWithEmailAndPAssword(
      String email, String password) async {
    try {
      //sign in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // catch any error

    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  //sign user out
}
