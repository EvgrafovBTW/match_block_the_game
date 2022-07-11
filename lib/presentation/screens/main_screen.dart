import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/text_constants.dart';
import '../components/appbars/main_appbar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: mainTitle,
      ),
      body: SafeArea(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: const Text(play)),
          ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(exit))
        ])),
      ),
    );
  }
}
