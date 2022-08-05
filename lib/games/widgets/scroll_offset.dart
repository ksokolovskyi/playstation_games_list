import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollOffset extends SingleChildRenderObjectWidget {
  const ScrollOffset({
    super.key,
    super.child,
    required this.scrollable,
    required this.factor,
    this.initialOffset = Offset.zero,
  });

  final ScrollableState scrollable;

  final double factor;

  final Offset initialOffset;

  @override
  RenderScrollOffset createRenderObject(BuildContext context) {
    return RenderScrollOffset(
      scrollable: scrollable.context,
      listenable: scrollable.position,
      factor: factor,
      initialOffset: initialOffset,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderScrollOffset renderObject,
  ) {
    renderObject
      ..scrollable = scrollable.context
      ..listenable = scrollable.position
      ..factor = factor
      ..initialOffset = initialOffset;
  }
}

class RenderScrollOffset extends RenderProxyBox {
  RenderScrollOffset({
    required BuildContext scrollable,
    required ScrollPosition listenable,
    required double factor,
    required Offset initialOffset,
  })  : _scrollable = scrollable,
        _listenable = listenable,
        _factor = factor,
        _initialOffset = initialOffset;

  static final _tween = Tween<double>(begin: -1, end: 1).chain(
    CurveTween(curve: Curves.easeOutSine),
  );

  BuildContext get scrollable => _scrollable;
  BuildContext _scrollable;
  set scrollable(BuildContext scrollable) {
    if (_scrollable == scrollable) return;

    _scrollable = scrollable;

    markNeedsLayout();
    markNeedsPaint();
  }

  ScrollPosition get listenable => _listenable;
  ScrollPosition _listenable;
  set listenable(ScrollPosition listenable) {
    if (_listenable == listenable) return;

    final oldListenable = _listenable;
    _listenable = listenable;

    if (attached) {
      oldListenable.removeListener(markNeedsPaint);
      _listenable.addListener(markNeedsPaint);
    }
  }

  double get factor => _factor;
  double _factor;
  set factor(double factor) {
    if (_factor == factor) return;

    _factor = factor;

    markNeedsPaint();
  }

  Offset get initialOffset => _initialOffset;
  Offset _initialOffset;
  set initialOffset(Offset initialOffset) {
    if (_initialOffset == initialOffset) return;

    _initialOffset = initialOffset;

    markNeedsPaint();
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _listenable.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _listenable.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }

    final _scrollableBox = _scrollable.findRenderObject()! as RenderBox;

    final y = localToGlobal(
      size.center(Offset.zero),
      ancestor: _scrollableBox,
    ).dy;

    final scrollFraction = (y / _scrollableBox.size.height).clamp(0.0, 1.0);

    final dy = _tween.transform(scrollFraction) * factor;

    context.pushTransform(
      needsCompositing,
      offset,
      Transform.translate(
        offset: initialOffset + Offset(0, dy),
      ).transform,
      super.paint,
    );
  }
}
