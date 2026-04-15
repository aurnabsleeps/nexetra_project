import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Nexetra is a project developed for the Software Development 2100 Lab course. "
              "This is our first experience working with Flutter and it has been a valuable learning journey for all of us. "
              "We hope to grow this project further in the future and turn it into something meaningful and real.\n\n"
              "Thank you for visiting our application.\n\n"
              "With regards,\n"
              "Aurnab Zaman\n"
              "Mahdinuzzaman Turjo\n"
              "Raisa Tabassum",
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}