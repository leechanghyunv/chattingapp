import 'package:flutter/material.dart';
import 'package:untitled7chat2/screens/mian_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatting app',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: LoginSignupScreen(),
    );
  }
}