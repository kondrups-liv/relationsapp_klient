import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  Future<UserCredential?> signin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
