import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _termsAgreed = false;

  // Text controllers for form fields
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to home page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Register to enhance your personal safety',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: 'Enter Your full name',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.person, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Your Phone number',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.phone, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Create a password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please create a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _termsAgreed,
                    onChanged: (value) {
                      setState(() {
                        _termsAgreed = value!;
                      });
                    },
                    activeColor: Colors.green,
                    checkColor: Colors.black,
                  ),
                  const Text(
                    'I agree with Terms and conditions',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _termsAgreed) {
                    // Add your sign-up logic here (e.g., API call, navigation)
                    print('Sign Up pressed!');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Add navigation to login page here
                    print('Log in tapped!');
                  },
                  child: const Text(
                    'Already registered? Log in',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}