import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ps_games/games/games.dart';
import 'package:ps_games/gen/assets.gen.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<List<Game>>.value(
      value: [
        Game(
          name: 'Cyberpunk 2077',
          image: AssetImage(Assets.games.cyberpunk.path),
          versions: const [Version.ps4, Version.ps5],
        ),
        Game(
          name: 'Ghost of Tsushima',
          image: AssetImage(Assets.games.ghostOfTsushima.path),
          versions: const [Version.ps4, Version.ps5],
        ),
        Game(
          name: 'The Last of Us Part II',
          image: AssetImage(Assets.games.theLastOfUs.path),
          versions: const [Version.ps4, Version.ps5],
        ),
        Game(
          name: 'Deathloop',
          image: AssetImage(Assets.games.deathloop.path),
          versions: const [Version.ps5],
        ),
        Game(
          name: 'Spider-Man: Miles Morales',
          image: AssetImage(Assets.games.spiderMan.path),
          versions: const [Version.ps4, Version.ps5],
        ),
        Game(
          name: 'Horizon Forbidden West',
          image: AssetImage(Assets.games.horizon.path),
          versions: const [Version.ps5],
        ),
      ],
      child: const GamesView(),
    );
  }
}

class GamesView extends StatelessWidget {
  const GamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: GamesAppBar(),
      body: GamesList(),
    );
  }
}
