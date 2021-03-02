import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/contact/model/contact_model.dart';

class ContactService {
  final contactCollection =
      FirebaseFirestore.instance.collection('"contactCollection"');

  addContact(ContactModel contactModel) {
    contactCollection.add(contactModel.toJson()).then((doc) {
      doc.get().then((snapshot) {
        print(snapshot.data());
      });
    });
  }

  // updateContact(ContactModel contactModel) {
  //   contactCollection
  //   .doc(ContactModel.key)
  //   .update(ContactModel.toJson())
  //   .then((snapshot){
  //     print("Actualizo");
  //   });
  // }

  // deleteContact(ContactModel, contactModel) {
  //   ContactModel.isDelete = true;
  //   contactCollection
  //   .doc(ContactModel.key)
  //   .update(ContactModel.toJson())
  //   .then((snapshot){
  //     print("Actualizo");
  //   });
  // }
}
