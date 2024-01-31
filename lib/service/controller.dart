

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names
  static Future<User?> userLogin(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
    return null;
  }

  //! login
  static Future<User?> userRegister(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$e"),
        ),
      );
    }
    return null;
  }
}



