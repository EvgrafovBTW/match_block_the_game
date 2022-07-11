import 'package:blockgame/constants/colors.dart';
import 'package:blockgame/router/app_router.dart';
import 'package:flutter/material.dart';

import 'constants/text_constants.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter router = AppRouter();
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: mainTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackground,
          primarySwatch: pimaryColor,
        ),
        initialRoute: '/',
        onGenerateRoute: router.onGeneratedRouter,
      );
}
