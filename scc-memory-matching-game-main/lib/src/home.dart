import 'package:flutter/material.dart';
import 'package:memory_matching_game/src/card_boards.dart';
import 'package:memory_matching_game/src/header.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tryCount = 0;

  void updateTryCount() {
    setState(() {
      tryCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECE7E4),
      appBar: AppBar(
        title: const Text('짝맞추기 게임'),
        backgroundColor: const Color(0xff92CBFF),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(tryCount: tryCount),
            SizedBox(height: 20),
            Expanded(child: CardBoards(updateTryCount: updateTryCount)),
          ],
        ),
      ),
    );
  }
}
