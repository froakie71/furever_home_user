import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              // Profile Image Placeholder
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                backgroundImage: const NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Create an account',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 32),
                textAlign: TextAlign.center,
              ),
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
                    'Log In',
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
