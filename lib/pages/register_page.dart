import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/components/my_textfield.dart';
import '/components/my_button.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onToggleView;
  const RegisterPage({super.key, required this.onToggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser() async {
    try {
      // Create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Sign out the user immediately after registration
      await FirebaseAuth.instance.signOut();

      // Show success dialog
      showDialog(
        context: context,
        barrierDismissible: false,  // Prevent dialog from being dismissed
        builder: (ctx) => AlertDialog(
          title: const Text("Registration Successful"),
          content: const Text("You have registered successfully. Click below to go to the login page."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // Close the dialog
                widget.onToggleView();  // Navigate to login
              },
              child: const Text("Go to Login"),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors here
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Registration Failed"),
          content: Text(e.message ?? "Unknown error occurred"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_add, size: 100, color: Colors.blue),
                const SizedBox(height: 50),
                Text(
                  'Create a New Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 36),
                // First Name field
                MyTextfield(
                  controller: firstNameController,
                  hintText: 'First Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Last Name field
                MyTextfield(
                  controller: lastNameController,
                  hintText: 'Last Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Email field
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Date of Birth field
                MyTextfield(
                  controller: dobController,
                  hintText: 'Date of Birth',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Password field
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                // Register button
                MyButton(
                  onTap: registerUser,
                  child: const Text('Register'),
                ),
                const SizedBox(height: 50),
                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onToggleView,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
