import 'package:flutter/material.dart';
import 'customerhomepage.dart'; // Make sure this import is correct

class CustomerLogin extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensure the container fills the entire width
        height: double.infinity, // Ensure the container fills the entire height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cs.jpg'), // Replace with your background image
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Assign the form key
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo or Title
                    Text(
                      'Customer Login',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Email Text Field
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.teal),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // Email validation logic
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black), // Text color changed to black
                    ),
                    const SizedBox(height: 16),
                    // Password Text Field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.teal),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      obscureText: true,
                      validator: (value) {
                        // Password validation logic
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.teal), // Text color changed to teal
                    ),
                    const SizedBox(height: 24),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // If the form is valid, navigate to the CustomerHomePage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomerHomePage(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFFE0F2F1), // Login button text color set to #E0F2F1
                            fontWeight: FontWeight.bold, // Make the text bold
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
