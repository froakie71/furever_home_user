import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Sign In'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0, vertical: 32.0), // Increased padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32), // Added top spacing
              Text('Create an account',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 32),
                  textAlign: TextAlign.center),
              const SizedBox(height: 40), // Increased spacing
              // Email TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 18), // Added internal padding
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24), // Increased spacing

              // Password TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 18), // Added internal padding
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40), // Increased spacing

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20), // Increased button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold), // Made text bold
                  ),
                ),
              ),
              const SizedBox(height: 24), // Increased spacing

              // Google Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20), // Increased button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google_logo.png',
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold), // Made text bold
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32), // Added bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
