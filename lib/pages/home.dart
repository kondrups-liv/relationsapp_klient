import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relationsapp_klient/models/client.dart';

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
    Client client = data['client'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Velkommen ${client.name}'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NAVN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                ),
              ),
              Text(
                client.name,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                ),
              ),
              Text(
                client.email,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'TELEFON',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                ),
              ),
              Text(
                client.phone,
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
