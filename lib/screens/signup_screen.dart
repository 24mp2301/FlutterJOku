import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signin_screen.dart'; // Navigate back to SignInScreen
import 'widgets.dart'; // For BorderedCircleImage

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    print('Username: $username, Email: $email, Password: $password');
    // TODO: Add actual sign-up logic here
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 15, 62, 17),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const BorderedCircleImage(
                    imagePath: 'assets/images/app_icon.png',
                    size: 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'SIGN UP',
                    style: GoogleFonts.pacifico(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 27, 255, 91),
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black26,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: greenInputDecoration('Username', Icons.person),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: greenInputDecoration('Email', Icons.email),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: greenInputDecoration('Password', Icons.lock),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 27, 255, 91),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Helper method to keep all input styles consistent and green
InputDecoration greenInputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Color.fromARGB(255, 27, 255, 91)),
    prefixIcon: Icon(icon, color: Color.fromARGB(255, 27, 255, 91)),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 27, 255, 91)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 27, 255, 91), width: 2),
    ),
    border: const OutlineInputBorder(),
  );
}
