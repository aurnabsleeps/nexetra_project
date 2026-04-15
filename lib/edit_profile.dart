import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Simple controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    bioController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // 1. Update Name in Firebase Auth
        if (nameController.text.isNotEmpty) {
          await user.updateDisplayName(nameController.text);
          await user.reload();
        }

        // 2. Update Password in Firebase Auth
        if (passwordController.text.isNotEmpty) {
          await user.updatePassword(passwordController.text);
        }

        // 3. Update Bio
        // NOTE: Firebase Auth user object does NOT have a dedicated "bio" field.
        // To store the bio permanently, you will typically need to use Cloud Firestore.
        // Example for Firestore:
        // if (bioController.text.isNotEmpty) {
        //   await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        //     'bio': bioController.text
        //   });
        // }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile updated successfully")),
          );
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update profile: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          

          const Text("Change Name", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Enter new name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),


          const Text("Change Password", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            controller: passwordController,
            obscureText: true, // hides the password
            decoration: const InputDecoration(
              hintText: "Enter new password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),


          const Text("Change Bio", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            controller: bioController,
            maxLines: 4, // Make the bio text field bigger
            decoration: const InputDecoration(
              hintText: "Enter new bio",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 40),


          ElevatedButton(
            onPressed: () {
              // Call the save changes function
              _saveChanges();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text("Save Changes", style: TextStyle(fontSize: 16)),
          ),

        ],
      ),
    );
  }
}
