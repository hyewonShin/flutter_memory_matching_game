import 'package:flutter/material.dart';
import 'package:memory_matching_game/src/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final Function()? onTap;
  const CardWidget({
    super.key,
    required this.card,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null && !card.isFlipped) {
          // 수정
          onTap!();
        }
      },
      child: Container(
        width: 115,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: card.isFlipped // 수정
            ? Center(
                child: Image.asset('assets/images/${card.cardValue}.png'), // 수정
              )
            : Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffBBD0E3),
                ),
                child: Center(child: Image.asset('assets/images/logo.png'))),
      ),
    );
  }
}
