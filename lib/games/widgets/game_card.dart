import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_games/games/models/models.dart';
import 'package:ps_games/games/widgets/widgets.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1.25,
            child: VerticalParallax(
              scrollable: Scrollable.of(context)!,
              child: Image(
                image: game.image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.6, 1],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 30,
              right: 20,
            ),
            child: _Label(game: game),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                game.name,
                style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                runSpacing: 10,
                children: game.versions
                    .map(
                      (v) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(
                          v.asset,
                          color: Colors.white,
                          height: 15,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        GestureDetector(
          child: const CircleAvatar(
            backgroundColor: Color(0xFF1788DA),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
