import 'package:flutter/material.dart';

class Squeeze extends StatefulWidget {
  const Squeeze({
    super.key,
    required this.squeeze,
    required this.child,
    this.onSqueeze,
  });

  final double squeeze;

  final Widget child;

  final void Function(double)? onSqueeze;

  @override
  State<Squeeze> createState() => _SqueezeState();
}

class _SqueezeState extends State<Squeeze> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _animation = _controller.drive(
      CurveTween(curve: Curves.easeIn),
    );

    if (widget.onSqueeze != null) {
      _animation.addListener(_onSqueeze);
    }
  }

  @override
  void dispose() {
    if (widget.onSqueeze != null) {
      _animation.removeListener(_onSqueeze);
    }

    _controller.dispose();

    super.dispose();
  }

  void _onSqueeze() {
    widget.onSqueeze?.call(_animation.value * widget.squeeze);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        _controller.forward();
      },
      onTapUp: (details) async {
        if (!_animation.isCompleted) {
          await Future<dynamic>.delayed(const Duration(milliseconds: 150));
        }

        await _controller.reverse();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        child: widget.child,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: widget.squeeze * (1 - _animation.value),
            ),
            child: Transform.scale(
              scale: 1 - _animation.value * widget.squeeze * 0.01,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
