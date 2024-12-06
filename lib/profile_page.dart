import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name = "Aljay Dinoy";
  final String email = "aljayenocdinoy@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/prof.png'),
            ),
            SizedBox(height: 20),
            Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(email, style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
