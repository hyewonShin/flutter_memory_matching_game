import 'package:flutter/material.dart';
import 'package:memory_matching_game/src/card.dart';

class CardBoards extends StatefulWidget {
  CardBoards({super.key});

  @override
  State<CardBoards> createState() => _CardBoardsState();
}

class _CardBoardsState extends State<CardBoards> {
  List<int> cards = [1, 5, 2, 6, 3, 4, 3, 2, 6, 1, 4, 5];

  List<bool> cardsFlippedState = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  int instantFirstCard = -1;

  void onTapCard(int cardIndex) {
    print('$cardIndex 번째 카드를 선택하셨습니다.');
    if (instantFirstCard == -1) {
      instantFirstCard = cardIndex;
    } else {
      // 두번째 카드가 선택되었을때 로직 추가
      var firstCard = cards[instantFirstCard];
      var secondCard = cards[cardIndex];
      if (firstCard == secondCard) {
        print('짝이 맞았습니다.');
        instantFirstCard = -1; // 추가
      } else {
        setState(() {
          cardsFlippedState[instantFirstCard] = false;
          cardsFlippedState[cardIndex] = false;
        });
        instantFirstCard = -1; // 추가
        return;
      }
    }
    setState(() {
      cardsFlippedState[cardIndex] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          for (var i = 0; i < cards.length; i++)
            CardWidget(
                cardNumber: cards[i],
                isFlipped: cardsFlippedState[i],
                onTap: () => onTapCard(i)),
        ],
      ),
    );
  }
}
