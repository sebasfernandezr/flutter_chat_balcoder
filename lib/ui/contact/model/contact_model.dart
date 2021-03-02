import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String key;
  String contactName;
  String phoneNumber;
  bool isDeleted;

  ContactModel({
    this.key, 
    this.contactName,
    this.phoneNumber,
    this.isDeleted,});

  toJson() {
    return {
      "contactName": contactName,
      "phoneNumber":phoneNumber,
    }; 
  }

factory ContactModel.fromSnapshot(DocumentSnapshot snapshot){
  return new ContactModel(
    contactName: snapshot.data()['contactName'],
    phoneNumber: snapshot.data()['phoneNumber'],
  );
}
}
