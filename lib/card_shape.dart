import 'package:budget_management_app/card_details.dart';
import 'package:budget_management_app/card_shape_clipper.dart';
import 'package:flutter/material.dart';

class CardShape extends StatelessWidget {
  final CardDetails cardDetails;
  const CardShape({
    super.key,
    required this.cardDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CardShapeClipper(),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                cardDetails.color[0],
                cardDetails.color[1],
              ],
            ),
          ),
          height: 160,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 12,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/visa.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        'assets/contactless.png',
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cardDetails.bankName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      cardDetails.currency,
                      style: const TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      cardDetails.cardNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Card Holder',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              cardDetails.holderName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Due date',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              cardDetails.dueDate,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
