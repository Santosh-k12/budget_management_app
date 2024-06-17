import 'package:budget_management_app/card_shape_clipper.dart';
import 'package:flutter/material.dart';

class CardShape extends StatelessWidget {
  final Color? color;
  // final String bankName;
  // final String currency;
  // final String holderName;
  // final String dueDate;
  const CardShape({
    super.key,
    required this.color,
    // required this.bankName,
    // required this.currency,
    // required this.holderName,
    // required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CardShapeClipper(),
      child: Container(
        color: color,
        height: 160,
        width: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}
