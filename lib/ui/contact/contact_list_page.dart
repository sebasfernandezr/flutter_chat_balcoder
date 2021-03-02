import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/contact/contact_service.dart';
import 'package:flutter_chat_balcoder/ui/contact/model/contact_model.dart';

class ContacListPage extends StatefulWidget {
  @override
  _ContacListPageState createState() => _ContacListPageState();
}

class _ContacListPageState extends State<ContacListPage> {
  ContactService _contactService = new ContactService();
  List<ContactModel> _contactList = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
      stream: _contactService.contactCollection
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
 
          default:

          print(snapshot.data.docs);
            snapshot.data.docs.forEach((doc) {
              print(doc.data());
             _contactList.add(new ContactModel.fromSnapshot(doc));
            });

            return ListView.builder(
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_contactList[index].contactName),
                  );
                });
        }
      },
    ));
  }
}
