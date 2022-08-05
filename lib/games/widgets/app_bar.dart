import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_games/gen/assets.gen.dart';

class GamesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GamesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: kToolbarHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 20,
                child: SvgPicture.asset(
                  Assets.svg.burger,
                  color: const Color(0xFF1788DA),
                  height: 15,
                ),
              ),
              SvgPicture.asset(
                Assets.svg.logo,
                color: const Color(0xFF1788DA),
                height: kToolbarHeight - 25,
              ),
              Positioned(
                right: 20,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svg.cart,
                      color: const Color(0xFF1788DA),
                      height: 20,
                    ),
                    const SizedBox(width: 20),
                    SvgPicture.asset(
                      Assets.svg.search,
                      color: const Color(0xFF1788DA),
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
