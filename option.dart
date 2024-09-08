import 'package:flutter/material.dart';
import 'alogin.dart'; // Import the AdminLogin page
import 'customerlogin.dart'; // Import the Customer login and registration

class Option extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var screenSize = MediaQuery.of(context).size;
    double avatarRadius = screenSize.width * 0.1;  // Smaller avatar size
    double fontSize = screenSize.width * 0.04;     // Slightly smaller font size

    return Scaffold(
      body: Container(
        width: screenSize.width,   // Make the container fill the width of the screen
        height: screenSize.height, // Make the container fill the height of the screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cs.jpg'),
            fit: BoxFit.cover,      // Ensure the background image covers the entire screen
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Admin option
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminLogin()), // Navigate to AdminLogin
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4), // Padding for the border
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.teal, // Teal-colored border for Admin
                          width: 4.0,        // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: avatarRadius, // Smaller avatar radius
                        backgroundImage: AssetImage('assets/admin.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: fontSize,  // Smaller dynamic font size
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenSize.width * 0.1),  // Reduce space between icons

              // Customer option
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerLogin()), // Navigate to Customer Login
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4), // Padding for the border
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE0F2F1), // Background color for Customer avatar
                        border: Border.all(
                          color: Colors.teal, // Teal-colored border for Customer
                          width: 4.0,        // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: avatarRadius,  // Avatar radius based on screen size
                        backgroundImage: AssetImage('assets/cust.jpg'),  // Ensure this file exists in your assets
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Customer',
                      style: TextStyle(
                        fontSize: fontSize,  // Smaller dynamic font size
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
