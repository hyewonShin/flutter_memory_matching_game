import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final int tryCount;
  Header({super.key, this.tryCount = 0});

  int score = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'score',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  letterSpacing: 0,
                  height: 0,
                ),
              ),
              Text(score.toString(),
                  style: TextStyle(
                      height: 0,
                      fontSize: 30,
                      letterSpacing: -2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'try count',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  letterSpacing: 0,
                  height: 0,
                ),
              ),
              Text(tryCount.toString(),
                  style: TextStyle(
                      height: 0,
                      fontSize: 30,
                      letterSpacing: -2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xff94BEE5),
              ),
              child: Center(child: Text('새 게임')),
            ),
          ),
        ],
      ),
    );
  }
}
