import 'package:flutter/material.dart';
import 'package:relationsapp_klient/pages/log_in.dart';
import 'package:relationsapp_klient/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LogIn(),
      '/home': (context) => Home(),
    },
  ));
}
