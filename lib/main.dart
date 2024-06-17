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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _middleCardAnimation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -0.55),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _topCardAnimation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -1.1),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _animationController
      ..reset()
      ..forward();

    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SlideTransition(
                position: _topCardAnimation,
                child: const CardShape(
                  color: Color.fromRGBO(92, 103, 237, 1),
                ),
              ),
              SlideTransition(
                position: _middleCardAnimation,
                child: const CardShape(
                  color: Color.fromRGBO(31, 31, 31, 1),
                ),
              ),
              const CardShape(
                color: Color.fromRGBO(15, 21, 204, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
