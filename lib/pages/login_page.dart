import 'package:flutter/material.dart';
import '/components/my_textfield.dart';
import '/components/my_button.dart';
import '/components/square_tile.dart';
import '/components/loading_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onToggleView;
  const LoginPage({super.key, required this.onToggleView});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false; // State to manage loading indicator visibility

  void loginUser() async {
  setState(() {
    isLoading = true; // Show loading indicator
  });

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    // No need to manually navigate; StreamBuilder in AuthPage will handle it
  } on FirebaseAuthException catch (e) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Login Failed"),
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
  } finally {
    setState(() {
      isLoading = false; // Hide loading indicator
    });
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
                const Icon(Icons.lock, size: 100, color: Colors.blue),
                const SizedBox(height: 50),
                Text(
                  'Welcome to Gym Metrics ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 36),
                // Email field
                MyTextfield(
                  controller: emailController,
                  hintText: 'Enter your email here',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // Password field
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Enter your password here',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // Forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // Login button
                isLoading 
                ? const LoadingIndicator()
                : MyButton(
                    onTap: loginUser,
                    child: const Text('Login'),
                  ),
                const SizedBox(height: 50),
                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Or Continue with'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/google.png'),
                    SizedBox(width: 15),
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),
                const SizedBox(height: 25),
                // Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onToggleView,
                      child: const Text(
                        'Register now',
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
