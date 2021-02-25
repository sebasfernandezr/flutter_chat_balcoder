import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
    FirebaseApp app =
        await Firebase.initializeApp();

    assert(app != null);
    print('Initialized $app');
  

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat Balcoder",
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
