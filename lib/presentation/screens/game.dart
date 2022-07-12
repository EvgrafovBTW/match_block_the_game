import 'dart:math';

import 'package:blockgame/logic/title_stream.dart';
import 'package:blockgame/presentation/components/appbars/main_appbar.dart';
import 'package:blockgame/presentation/components/game_elements/game_cell.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int cellAmount = 100;
  int cellAmountLimit = 20;
  List<bool> cellBoolList = [];
  Color cellColor = Colors.red;
  Random random = Random();
  int activeCell = 0;
  List<int> cellAmountTypes = [];
  TitleStream titleStream = TitleStream();
  @override
  void didChangeDependencies() {
    titleStream.stream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 7; i < cellAmountLimit; i++) {
      cellAmountTypes.add(i * i);
    }
    generateFieldCell() {
      setState(() {
        cellAmount = cellAmountTypes[random.nextInt(cellAmountTypes.length)];
        activeCell = random.nextInt(cellAmount);
        cellBoolList.clear();
        for (int i = 0; i < cellAmount; i++) {
          cellBoolList.add(false);
        }
        cellBoolList[activeCell] = true;
      });
    }

    generateFieldCell();

    return Scaffold(
      appBar: const MainAppBar(
        title: 'Так же попробуйте cock',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('the game'),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (sqrt(cellAmount)).ceil(),
                  childAspectRatio: cellAmount / cellAmount),
              shrinkWrap: true,
              itemCount: cellAmount,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {},
                    child: GameCell(
                      cellColor: cellColor,
                      isCellActive: cellBoolList[index],
                    ));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  generateFieldCell();
                },
                child: Text('Заново'))
          ],
        ),
      ),
    );
  }
}
