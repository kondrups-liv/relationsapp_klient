import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relationsapp_klient/models/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    UserCredential userCredential = data['userCredential'];
    String email = userCredential.user!.email!;
    Client client = Client(email: email);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Velkommen ${client.email}'),
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
