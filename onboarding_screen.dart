import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward(); // Start the animation automatically
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('assets/screen.png', fit: BoxFit.cover),
          ),

          // Animated logo
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: ClipOval(
                child: Container(
                  color: Colors.white,
                  width: 500,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                      'assets/electro.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Get Started button at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 22, color: Colors.deepPurple),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
