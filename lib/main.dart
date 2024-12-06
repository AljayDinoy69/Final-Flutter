// lib/main.dart
import 'package:flutter/material.dart';
import 'home_page.dart';   // Import HomePage
import 'data_page.dart';   // Import DataPage
import 'profile_page.dart'; // Import ProfilePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),  // Set the HomePage as the starting page
      routes: {
        '/data': (context) => DataPage(),  // Add a route for the DataPage
        '/profile': (context) => ProfilePage(),  // Add a route for the ProfilePage
      },
    );
  }
}
