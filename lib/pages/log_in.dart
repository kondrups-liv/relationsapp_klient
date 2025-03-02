import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relationsapp_klient/services/authentication.dart';
import 'package:relationsapp_klient/services/database.dart';
import 'package:relationsapp_klient/models/client.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void logIn() async {
    UserCredential? userCredential = await Authentication().signin(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
    if (userCredential != null) {
      Client client = await Database().getBasicUserInfo();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'client': client,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log In",
                style: TextStyle(
                  fontSize: 42,
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adgangskode',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  logIn();
                },
                child: Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
