import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ps_games/games/games.dart';

class GamesList extends StatefulWidget {
  const GamesList({super.key});

  @override
  State<GamesList> createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {
  EdgeInsets _padding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    final games = context.watch<List<Game>>();

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 20) + _padding,
      separatorBuilder: (_, __) => const SizedBox.shrink(),
      itemCount: games.length + 1,
      itemBuilder: (context, i) {
        if (i == 0) {
          return const Header();
        }

        final index = i - 1;

        return Stack(
          children: [
            Squeeze(
              squeeze: 15,
              onSqueeze: (squeeze) {
                setState(() {
                  _padding = EdgeInsets.only(top: squeeze);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GameCard(game: games[index]),
              ),
            ),
            if (index.isOdd)
              const SymbolsOverlay(type: SymbolsOverlayType.rectangleAndCross)
            else
              const SymbolsOverlay(type: SymbolsOverlayType.circleAndTriangle),
          ],
        );
      },
    );
  }
}
