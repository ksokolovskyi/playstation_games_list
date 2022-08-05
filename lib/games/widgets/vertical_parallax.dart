// ignore_for_file: prefer_asserts_with_message

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VerticalParallax extends SingleChildRenderObjectWidget {
  VerticalParallax({
    super.key,
    required this.scrollable,
    required Widget child,
  }) : super(child: RepaintBoundary.wrap(child, 0));

  final ScrollableState scrollable;

  @override
  RenderVerticalParallax createRenderObject(BuildContext context) {
    return RenderVerticalParallax(
      scrollable: scrollable.context,
      listenable: scrollable.position,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderVerticalParallax renderObject,
  ) {
    renderObject
      ..scrollable = scrollable.context
      ..listenable = scrollable.position;
  }
}

class RenderVerticalParallax extends RenderProxyBox {
  RenderVerticalParallax({
    required BuildContext scrollable,
    required ScrollPosition listenable,
  })  : _scrollable = scrollable,
        _listenable = listenable;

  BuildContext get scrollable => _scrollable;
  BuildContext _scrollable;
  set scrollable(BuildContext scrollable) {
    if (_scrollable == scrollable) return;

    _scrollable = scrollable;

    markNeedsLayout();
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

  Size _getSize(BoxConstraints constraints) {
    assert(constraints.debugAssertIsValid());
    return constraints.constrain(constraints.biggest);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _getSize(constraints);
  }

  @override
  void performLayout() {
    if (child == null) {
      return;
    }

    size = _getSize(constraints);

    final innerConstraints = BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );

    child!.layout(innerConstraints, parentUsesSize: true);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }

    final _scrollableBox = _scrollable.findRenderObject()! as RenderBox;

    // Calculate the position of this list item within the viewport.
    final listItemOffset = localToGlobal(
      size.centerLeft(Offset.zero),
      ancestor: _scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = _listenable.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize = child!.size;

    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & size,
    );

    // Paint the background.
    final transform = Transform.translate(
      offset: Offset(0, childRect.top),
    ).transform;

    context.pushTransform(
      needsCompositing,
      offset,
      transform,
      super.paint,
    );
  }
}
