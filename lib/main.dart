import 'package:budget_management_app/card_details.dart';
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
  List<CardDetails> cards = [
    CardDetails(
      color: [
        const Color.fromARGB(255, 128, 137, 246),
        const Color.fromARGB(255, 81, 93, 234),
      ],
      bankName: 'YRB YourBank',
      currency: 'PLN',
      cardNumber: '4554 **** **** 7356',
      holderName: 'Eduard Albina',
      dueDate: '08/29',
    ),
    CardDetails(
      color: [
        const Color.fromARGB(255, 56, 56, 56),
        const Color.fromARGB(255, 28, 28, 28),
      ],
      bankName: 'BetaBank',
      currency: 'EUR',
      cardNumber: '9732 **** **** 8452',
      holderName: 'Neelima Liesel',
      dueDate: '03/35',
    ),
    CardDetails(
      color: [
        const Color.fromARGB(255, 31, 97, 245),
        const Color.fromARGB(255, 17, 24, 207),
      ],
      bankName: 'MNO Bank',
      currency: 'USD',
      cardNumber: '7564 **** **** 5658',
      holderName: 'Monica Warren',
      dueDate: '12/25',
    ),
  ];

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
              child: CardShape(
                cardDetails: cards[0],
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            child: SlideTransition(
              position: _middleCardAnimation,
              child: CardShape(
                cardDetails: cards[1],
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            child: SlideTransition(
              position: _lastCardAnimation,
              child: Stack(
                children: [
                  CardShape(
                    cardDetails: cards[2],
                  ),
                  // Positioned(
                  //   left: 80,
                  //   child: Container(
                  //     height: 60,
                  //     width: 80,
                  //     color: const Color.fromRGBO(84, 110, 243, 1),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
