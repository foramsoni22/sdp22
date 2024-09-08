import 'package:flutter/material.dart';
import 'adminhomepage.dart'; // Import Admin Home Page

void main() {
  runApp(AdminLoginApp());
}

class AdminLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: AdminLogin(),
    );
  }
}

class AdminLogin extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,  // Ensure the container fills the entire width
        height: double.infinity, // Ensure the container fills the entire height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cs.jpg'),  // Replace with your background image
            fit: BoxFit.cover,   // Ensures the image covers the entire screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo or Title
                  Text(
                    'Admin Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Email Text Field
                  TextField(
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
                    style: TextStyle(color: Colors.black), // Text color changed to black
                  ),
                  const SizedBox(height: 16),
                  // Password Text Field
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.teal),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.teal), // Text color changed to teal
                  ),
                  const SizedBox(height: 24),
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Check if the email is correct
                        if (_emailController.text == 'admin@123gmail.com') {
                          // Check if the password is correct
                          if (_passwordController.text == 'admin') {
                            // Navigate to AdminHomePage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminHomePage(),
                              ),
                            );
                          } else {
                            // Show an error message for incorrect password
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Invalid Password'),
                                content: const Text('Please check your password.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          // Show an error message for incorrect email
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Invalid Email'),
                              content: const Text('Please check your email ID.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFFE0F2F1),  // Login button text color set to #E0F2F1
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
    );
  }
}
