import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'GREAT GAMES',
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                color: Color(0xFF1788DA),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Coming Soon',
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                color: Color(0xFF757575),
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
