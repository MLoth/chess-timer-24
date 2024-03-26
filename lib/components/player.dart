import 'package:chess_timer/utils/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Player extends StatelessWidget {
  final int player;

  const Player({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context.read<Game>().getPlayer(player).isPlaying);

    return Transform.flip(
      flipY: player == 0,
      flipX: player == 0,
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: player == 0
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 64,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print('Start counter');
                    context.read<Game>().start(player);
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: player == 0
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Text('Player ${player + 1}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 24,
                          )),
                    ),
                  ),
                ),
                Text(
                    '${context.watch<Game>().getPlayer(player).timeLeft.inMinutes.toString()}:${context.watch<Game>().getPlayer(player).timeLeft.inSeconds.toString()}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
