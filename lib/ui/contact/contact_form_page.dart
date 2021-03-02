import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/contact/model/contact_model.dart';
import 'package:flutter_chat_balcoder/ui/contact/contact_service.dart';

class ContactFormPage extends StatefulWidget {
  ContactFormPage({this.contactList, this.currentIndex});
  int currentIndex;

  List<ContactModel> contactList;
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  TextEditingController _cName;
  TextEditingController _cPhoneNumber;
  ContactModel _contactModel;
  ContactService _contactService = new ContactService();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact form page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              controller: _cName,
              decoration: InputDecoration(
                fillColor: Colors.yellow,
                  labelText: "Ingrese su nombre", icon: Icon(Icons.person)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: _cPhoneNumber,
              decoration: InputDecoration(
                  icon: Icon(Icons.phone_android),
                  labelText: "Ingrese su celular"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _contactModel.contactName = _cName.text;
                _contactModel.phoneNumber = _cPhoneNumber.text;

                if (widget.currentIndex != null) {
                  //LA ACTUALIZACIÓN
                  setState(() {
                    // ContactService().updateContact( _contactModel);
                  });
                } else {
                  //LA CREACIÓN
                  setState(() {
                    ContactService().addContact( _contactModel);
                  });
                }

                //reseteadores
                _contactModel = new ContactModel();
                _cName.text = "";
                _cPhoneNumber.text = "";
                widget.currentIndex = null;
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                    child: Text(
                  /*if terciario, si existe el botón actualiza si no, guarda*/
                  widget.currentIndex != null ? "Actualizar" : "Guardar",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
                height: _height * 0.05,
                width: _width * 0.24,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
