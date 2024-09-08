import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Use headlineMedium
        ),
      ),
      home: AdminHomePage(),
    );
  }
}

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home Page'),
        backgroundColor: Colors.teal, // Set AppBar background color to teal
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
      drawer: AdminDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Admin Dashboard',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white), // Use headlineMedium
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsPage(title: 'VR')),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4), // Padding for the border
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.teal, // Teal-colored border
                              width: 4.0,        // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/vr_icon.png'), // VR icon
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'VR',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsPage(title: 'Visual Search')),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4), // Padding for the border
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.teal, // Teal-colored border
                              width: 4.0,        // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/visual_search_icon.png'), // Visual search icon
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Visual Search',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsPage(title: 'Products')),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4), // Padding for the border
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.teal, // Teal-colored border
                              width: 4.0,        // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/product_icon.png'), // Product icon
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Products',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text(
              'Admin Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Customer Reviews'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(title: 'Customer Reviews')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text('Product Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(title: 'Product Management')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Order Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(title: 'Order Management')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Customer Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(title: 'Customer Management')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(title: 'Payment Management')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('System Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(title: 'System Settings')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;

  DetailsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal, // Set AppBar background color to teal
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cs.jpg'), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Details for $title',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
