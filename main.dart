import 'package:flutter/material.dart';
import 'option.dart'; // Import the login.dart file

Future<void> main() async => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Colors.white70),
        ),
      ),
      home: const AnimatedImageText(),
    );
  }
}

class AnimatedImageText extends StatefulWidget {
  const AnimatedImageText({super.key});

  @override
  _AnimatedImageTextState createState() => _AnimatedImageTextState();
}

class _AnimatedImageTextState extends State<AnimatedImageText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final String text = 'valcal           style';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Reduced duration for faster animation
      vsync: this,
    )..forward();

    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Option()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/c.jpg'),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return _buildAnimatedText();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedText() {
    List<Widget> letters = [];
    double letterDelay = 0.02; // Reduced delay between each letter

    for (int i = 0; i < text.length; i++) {
      double delay = i * letterDelay;
      letters.add(
        AnimatedOpacity(
          opacity: _controller.value > delay ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300), // Reduced duration for faster fade-in
          child: Text(
            text[i],
            style: const TextStyle(
              fontSize: 38,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontFamilyFallback: ['Arial', 'Helvetica'],



            ),
          ),
        ),
      );
    }


    return Row(
      mainAxisSize: MainAxisSize.min,
      children: letters,

    );
  }
}