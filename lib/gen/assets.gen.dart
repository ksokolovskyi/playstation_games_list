/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsGamesGen {
  const $AssetsGamesGen();

  /// File path: assets/games/cyberpunk.jpeg
  AssetGenImage get cyberpunk =>
      const AssetGenImage('assets/games/cyberpunk.jpeg');

  /// File path: assets/games/deathloop.jpg
  AssetGenImage get deathloop =>
      const AssetGenImage('assets/games/deathloop.jpg');

  /// File path: assets/games/ghost-of-tsushima.jpeg
  AssetGenImage get ghostOfTsushima =>
      const AssetGenImage('assets/games/ghost-of-tsushima.jpeg');

  /// File path: assets/games/horizon.jpg
  AssetGenImage get horizon => const AssetGenImage('assets/games/horizon.jpg');

  /// File path: assets/games/spider-man.jpg
  AssetGenImage get spiderMan =>
      const AssetGenImage('assets/games/spider-man.jpg');

  /// File path: assets/games/the-last-of-us.jpeg
  AssetGenImage get theLastOfUs =>
      const AssetGenImage('assets/games/the-last-of-us.jpeg');
}

class $AssetsGoogleFontsGen {
  const $AssetsGoogleFontsGen();

  /// File path: assets/google_fonts/OFL.txt
  String get ofl => 'assets/google_fonts/OFL.txt';

  /// File path: assets/google_fonts/WorkSans-Light.ttf
  String get workSansLight => 'assets/google_fonts/WorkSans-Light.ttf';

  /// File path: assets/google_fonts/WorkSans-Medium.ttf
  String get workSansMedium => 'assets/google_fonts/WorkSans-Medium.ttf';

  /// File path: assets/google_fonts/WorkSans-Regular.ttf
  String get workSansRegular => 'assets/google_fonts/WorkSans-Regular.ttf';

  /// File path: assets/google_fonts/WorkSans-SemiBold.ttf
  String get workSansSemiBold => 'assets/google_fonts/WorkSans-SemiBold.ttf';
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/burger.svg
  String get burger => 'assets/svg/burger.svg';

  /// File path: assets/svg/cart.svg
  String get cart => 'assets/svg/cart.svg';

  /// File path: assets/svg/logo.svg
  String get logo => 'assets/svg/logo.svg';

  /// File path: assets/svg/ps4.svg
  String get ps4 => 'assets/svg/ps4.svg';

  /// File path: assets/svg/ps5.svg
  String get ps5 => 'assets/svg/ps5.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';
}

class $AssetsSymbolsGen {
  const $AssetsSymbolsGen();

  /// File path: assets/symbols/symbols_1.png
  AssetGenImage get symbols1 =>
      const AssetGenImage('assets/symbols/symbols_1.png');

  /// File path: assets/symbols/symbols_2.png
  AssetGenImage get symbols2 =>
      const AssetGenImage('assets/symbols/symbols_2.png');
}

class Assets {
  Assets._();

  static const $AssetsGamesGen games = $AssetsGamesGen();
  static const $AssetsGoogleFontsGen googleFonts = $AssetsGoogleFontsGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsSymbolsGen symbols = $AssetsSymbolsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
