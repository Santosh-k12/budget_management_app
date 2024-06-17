import 'package:budget_management_app/card_shape.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _middleCardAnimation;
  late Animation<Offset> _topCardAnimation;
  late Animation<Offset> _lastCardAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _topCardAnimation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -2.5),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
      ),
    );
    _middleCardAnimation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -1.9),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.33, 0.66, curve: Curves.easeInOut),
      ),
    );
    _lastCardAnimation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -1.3),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.66, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController
      ..reset()
      ..forward();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -160,
            child: SlideTransition(
              position: _topCardAnimation,
              child: const CardShape(
                color: Color.fromRGBO(92, 103, 237, 1),
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            child: SlideTransition(
              position: _middleCardAnimation,
              child: const CardShape(
                color: Color.fromRGBO(31, 31, 31, 1),
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            child: SlideTransition(
              position: _lastCardAnimation,
              child: const CardShape(
                color: Color.fromRGBO(15, 21, 204, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
