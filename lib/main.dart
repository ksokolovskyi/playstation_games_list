import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_games/app/app.dart';
import 'package:ps_games/gen/assets.gen.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString(Assets.googleFonts.ofl);
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const App());
}
