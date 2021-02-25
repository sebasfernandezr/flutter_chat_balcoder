
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ContacListPage extends StatefulWidget {
  @override
  _ContacListPageState createState() => _ContacListPageState();
}

class _ContacListPageState extends State<ContacListPage> {
  CollectionReference contactCollection =
      FirebaseFirestore.instance.collection('"contactCollection"');

  @override
  void initState() {
    super.initState();
    contactCollection.get().asStream().listen((snapshot) {
      print(snapshot.docs.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
