import 'package:blockgame/game/game.dart';
import 'package:blockgame/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGeneratedRouter(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (builder) => const App());
      case '/game':
        return CupertinoPageRoute(builder: (builder) => const Game());
      default:
        return CupertinoPageRoute(
            builder: (builder) => const Scaffold(
                  body: Center(
                    child: Text('sakni'),
                  ),
                ));
    }
  }
}
