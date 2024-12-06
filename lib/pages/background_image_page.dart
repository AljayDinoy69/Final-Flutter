import 'package:flutter/material.dart';

class BackgroundImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wall1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Welcome!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
