import 'package:flutter/material.dart';
import 'package:ps_games/gen/assets.gen.dart';

enum Version {
  ps4,
  ps5;

  String get asset {
    switch (this) {
      case ps4:
        return Assets.svg.ps4;

      case ps5:
        return Assets.svg.ps5;
    }
  }
}

class Game {
  const Game({
    required this.image,
    required this.name,
    required this.versions,
  });

  final ImageProvider image;

  final String name;

  final List<Version> versions;
}
