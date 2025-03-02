import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  User? _user;

  Future<UserCredential?> signin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String message = 'Ugyldig email eller adgangskode';
      print('$message ${e.code}');
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
