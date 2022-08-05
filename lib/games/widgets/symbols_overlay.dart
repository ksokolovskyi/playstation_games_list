import 'package:flutter/material.dart';
import 'package:ps_games/games/widgets/widgets.dart';

enum SymbolsOverlayType {
  circleAndTriangle(
    asset: 'assets/symbols/symbols_1.png',
    alignment: Alignment.topLeft,
  ),
  rectangleAndCross(
    asset: 'assets/symbols/symbols_2.png',
    alignment: Alignment.topRight,
  );

  const SymbolsOverlayType({
    required this.asset,
    required this.alignment,
  });

  final String asset;

  final Alignment alignment;
}

class SymbolsOverlay extends StatelessWidget {
  const SymbolsOverlay({
    super.key,
    required this.type,
  });

  final SymbolsOverlayType type;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    final side = data.size.width * 0.5;
    final offset = side * 0.4;
    final factor = data.size.height * 0.15;

    return IgnorePointer(
      child: Align(
        alignment: type.alignment,
        child: ScrollOffset(
          scrollable: Scrollable.of(context)!,
          factor: factor,
          initialOffset: Offset(
            type.alignment.x < Alignment.center.x ? -offset : offset,
            0,
          ),
          child: SizedBox(
            height: side,
            width: side,
            child: Image.asset(
              type.asset,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
