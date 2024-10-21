import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final bool isFlipped;
  final int cardNumber;
  final Function()? onTap;
  CardWidget({
    super.key,
    this.isFlipped = false,
    this.cardNumber = 1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null && !isFlipped) {
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
        child: isFlipped
            ? Center(
                child: Image.asset('assets/images/$cardNumber.png'),
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
