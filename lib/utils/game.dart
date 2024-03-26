import 'dart:async';
import 'package:flutter/material.dart';

class PlayerState {
  final int player;
  final Duration timeLeft;
  final Timer? isPlaying;

  const PlayerState(this.player, this.timeLeft, [this.isPlaying]);
}

class Game with ChangeNotifier {
  final List<PlayerState> _players = [
    const PlayerState(0, Duration(minutes: 10)),
    const PlayerState(1, Duration(minutes: 13)),
  ];

  PlayerState getPlayer(int player) => _players[player];

  void start(int player) {
    // Check if the other player is playing
    if (_players[1 - player].isPlaying != null) {
      _players[1 - player].isPlaying!.cancel();
    }

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_players[player].timeLeft.inSeconds == 0) {
        timer.cancel();
        return;
      }

      _players[player] = PlayerState(
        player,
        _players[player].timeLeft - const Duration(seconds: 1),
        timer,
      );
      notifyListeners();
    });
    notifyListeners();
  }
}
