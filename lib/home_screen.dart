import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'jobboard_screen.dart';
import 'appliedjob_screen.dart';
import 'confirmedjob_screen.dart';
import 'cancelled_jobs.dart';
import 'about_us.dart';
import 'loginInfluencer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Nexetra",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == "about") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ),
                );
              } else if (value == "logout") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginInfluencer(),
                  ),
                      (route) => false,
                );
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: "about",
                child: Text("About Us"),
              ),
              PopupMenuItem(
                value: "logout",
                child: Text("Logout"),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            buildButton(context, Icons.person, "Profile",
                const ProfileScreen()),
            buildButton(context, Icons.dashboard, "Job Board",
                const JobBoardScreen()),
            buildButton(context, Icons.task_alt, "Applied",
                const AppliedJobScreen()),
            buildButton(context, Icons.check_circle, "Confirmed",
                const ConfirmedJobScreen()),
            buildButton(context, Icons.cancel, "Cancelled",
                const CancelledJobs()),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
      BuildContext context,
      IconData icon,
      String label,
      Widget page,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}