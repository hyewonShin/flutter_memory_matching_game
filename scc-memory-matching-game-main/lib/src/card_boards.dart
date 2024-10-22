import 'package:flutter/material.dart';
import 'package:memory_matching_game/src/card.dart';
import 'package:memory_matching_game/src/card_model.dart';

class CardBoards extends StatefulWidget {
  final Function() updateTryCount;
  CardBoards({super.key, required this.updateTryCount});

  @override
  State<CardBoards> createState() => _CardBoardsState();
}

class _CardBoardsState extends State<CardBoards> {
  late List<CardModel> cards;
  @override
  void initState() {
    super.initState();
    List<int> cardsValue = [1, 5, 2, 6, 3, 4, 3, 2, 6, 1, 4, 5];
    cardsValue.shuffle();
    cards = List.generate(cardsValue.length, (index) {
      return CardModel(index: index, cardValue: cardsValue[index]);
    });
  }

  CardModel? instantFirstCard;

  void onTapCard(int cardIndex) {
    print('$cardIndex 번째 카드를 선택하셨습니다.');
    if (instantFirstCard == null) {
      instantFirstCard = cards[cardIndex];
    } else {
      // 두번째 카드가 선택되었을때 로직 추가
      widget.updateTryCount();
      var firstCard = instantFirstCard;
      var secondCard = cards[cardIndex];
      if (firstCard!.cardValue == secondCard.cardValue) {
        print('짝이 맞았습니다.');
        instantFirstCard = null;
      } else {
        resetInstantCards(instantFirstCard!, secondCard);
      }
    }
    setState(() {
      cards[cardIndex].setFlipped(true);
    });
  }

  void resetInstantCards(CardModel firstCard, CardModel secondCard) async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      firstCard.setFlipped(false);
      secondCard.setFlipped(false);
    });
    instantFirstCard = null;
    return;
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
              card: cards[i],
              onTap: () {
                onTapCard(i);
              },
            ),
        ],
      ),
    );
  }
}
