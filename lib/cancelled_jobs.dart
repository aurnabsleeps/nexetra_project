import 'package:flutter/material.dart';

class CancelledJobs extends StatelessWidget {
  const CancelledJobs({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cancelled Jobs",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text(
          "No cancelled jobs yet",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}