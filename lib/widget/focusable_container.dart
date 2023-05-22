import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusableBuilder extends StatefulWidget {
  const FocusableBuilder({
    super.key,
    required this.builder,
    this.onSelect,
  });

  final Widget Function(BuildContext context, bool focused) builder;
  final VoidCallback? onSelect;
  // implement what is necessary here

  @override
  State<FocusableBuilder> createState() => _FocusableBuilderState();
}

class _FocusableBuilderState extends State<FocusableBuilder> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKey: (node, event) => onTVRemoteKey(
        node,
        event,
        onSelect: widget.onSelect,
        // implement what is necessary here
      ),
      onFocusChange: (value) => setState(() => focused = value),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: AnimatedScale(
          scale: focused ? 1.08 : 1,
          duration: const Duration(milliseconds: 400),
          child: widget.builder(context, focused),
        ),
      ),
    );
  }
}

KeyEventResult onTVRemoteKey(
  FocusNode node,
  RawKeyEvent event, {
  VoidCallback? onArrowUp,
  VoidCallback? onArrowRight,
  VoidCallback? onArrowDown,
  VoidCallback? onArrowLeft,
  VoidCallback? onSelect,
  VoidCallback? onHoldArrowUp,
  VoidCallback? onHoldArrowRight,
  VoidCallback? onHoldArrowDown,
  VoidCallback? onHoldArrowLeft,
  VoidCallback? onHoldSelect,
}) {
  if (event is RawKeyUpEvent) {
    return KeyEventResult.ignored;
  }

  final RawKeyEvent(:repeat, :logicalKey) = event;
  final func = switch ((repeat, logicalKey)) {
    (false, LogicalKeyboardKey.arrowUp) => onArrowUp,
    (false, LogicalKeyboardKey.arrowRight) => onArrowRight,
    (false, LogicalKeyboardKey.arrowDown) => onArrowDown,
    (false, LogicalKeyboardKey.arrowLeft) => onArrowLeft,
    (false, LogicalKeyboardKey.select) => onSelect,
    (false, LogicalKeyboardKey.space) => onSelect,
    (false, LogicalKeyboardKey.enter) => onSelect,
    (false, LogicalKeyboardKey.select) => onSelect,
    (true, LogicalKeyboardKey.arrowUp) => onHoldArrowUp,
    (true, LogicalKeyboardKey.arrowRight) => onHoldArrowRight,
    (true, LogicalKeyboardKey.arrowDown) => onHoldArrowDown,
    (true, LogicalKeyboardKey.arrowLeft) => onHoldArrowLeft,
    (true, LogicalKeyboardKey.select) => onHoldSelect,
    (true, LogicalKeyboardKey.space) => onHoldSelect,
    (true, LogicalKeyboardKey.enter) => onHoldSelect,
    _ => null,
  };

  if (func == null) {
    return KeyEventResult.ignored;
  }

  func.call();
  return KeyEventResult.handled;
}
