import 'package:flutter/material.dart';

class CardDetails {
  final List<Color> color;
  final String bankName;
  final String currency;
  final String cardNumber;
  final String holderName;
  final String dueDate;

  CardDetails({
    required this.color,
    required this.bankName,
    required this.currency,
    required this.cardNumber,
    required this.holderName,
    required this.dueDate,
  });
}
