import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

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
  math.Random random = math.Random();
  int activeCell = 0;
  int nVal = 0;
  List<int> cellAmountTypes = [];
  List<String> titles = ['test', 'test2'];
  List<String> subtitles = [];
  final titleStream = TitleCreator().stream.asBroadcastStream();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final testStream =
        TestStream(toAdd: '').getRandom(t: titles).asBroadcastStream();
    StreamController controller = StreamController();
    Stream stream = controller.stream;
    // final sub = titleStream.listen((event) {
    //   print('Data: $event');
    // changeNum(num: event);
    // });

    testStream.listen((event) {
      print(event);
    }, onDone: () async {
      // await Future.delayed(Duration(seconds: 2));
      titles.clear();
      nVal = 0;
    });

    // List<String> titles = ['default', 'default 2'];
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
        title: 'Так же попробуйте ',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('the game'),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (math.sqrt(cellAmount)).ceil(),
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
                  // generateFieldCell();
                  // setState(() {
                  subtitles.add(nVal.toString());
                  nVal++;
                  if (nVal > 5) {
                    setState(() {
                      titles = subtitles;
                    });
                  }
                  // titles.add('value $nVal');
                  // });
                },
                child: Text('Заново')),
            ElevatedButton(
                onPressed: () {},
                child: StreamBuilder(
                  stream: titleStream,
                  builder: (context, snapshot) {
                    // if (snapshot.data == 10) {
                    //   sub.cancel();
                    // }
                    if (snapshot.hasData) {
                      return Text("${snapshot.data}");
                    } else {
                      return Text('default');
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
