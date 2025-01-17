import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class HorizontalList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double? spacing;
  final double? runSpacing;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool? reverse;
  final ScrollController? controller;

  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? crossAxisAlignment;

  HorizontalList({
    required this.itemCount,
    required this.itemBuilder,
    this.spacing,
    this.runSpacing,
    this.padding,
    this.physics,
    this.controller,
    this.reverse,
    this.wrapAlignment,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: physics,
        padding: padding ?? EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        reverse: reverse.validate(),
        controller: controller,
        child: Wrap(
          spacing: spacing ?? 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          direction: Axis.horizontal,
          runAlignment: wrapAlignment ?? WrapAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
          runSpacing: runSpacing ?? 8,
          children:
              List.generate(itemCount, (index) => itemBuilder(context, index)),
        ),
      ),
    );
  }
}
