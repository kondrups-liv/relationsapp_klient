import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:relationsapp_klient/models/client.dart';

class Database {
  final db = FirebaseFirestore.instance;
  Future<Client> getBasicUserInfo() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('clients')
        .doc('SXNUH3mipkOQIUKUNo3j4Neym192')
        .get();

    Map data = doc.data() as Map<String, dynamic>;

    String name = data['first_name'];
    String email = data['email'];
    String phone = data['phone'];

    return Client(name: name, email: email, phone: phone);
  }
}
