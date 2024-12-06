// lib/home_page.dart
import 'package:flutter/material.dart';
import 'data_page.dart'; // Import DataPage
import 'profile_page.dart'; // Import ProfilePage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wall1.png'), // Path to the image
            fit: BoxFit.cover,  // Ensures the image covers the screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataPage()),
                  );
                },
                child: Text('Go to Data Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text('Go to Profile Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
