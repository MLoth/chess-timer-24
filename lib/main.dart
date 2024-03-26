import 'package:chess_timer/components/controls.dart';
import 'package:chess_timer/components/player.dart';
import 'package:chess_timer/utils/game.dart';
import 'package:chess_timer/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Game()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Theme(
          data: getTheme(),
          child: const Column(
            children: [
              Expanded(
                child: Player(player: 0),
              ),
              Controls(),
              Expanded(
                child: Player(player: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
