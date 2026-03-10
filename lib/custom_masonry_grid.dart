import 'package:flutter/material.dart';

/// A lightweight, reusable, and dependency-free Masonry Grid widget.
/// 
/// Perfect for creating image galleries or Pinterest-style layouts.
class CustomMasonryGrid extends StatelessWidget {
  /// The list of widgets to display in the grid.
  final List<Widget> items;

  /// The number of columns in the grid. Defaults to 2.
  final int crossAxisCount;

  /// The vertical spacing between items. Defaults to 10.0.
  final double mainAxisSpacing;

  /// The horizontal spacing between columns. Defaults to 10.0.
  final double crossAxisSpacing;

  /// The padding around the grid. Defaults to EdgeInsets.zero.
  final EdgeInsetsGeometry padding;

  /// The border radius for the grid items. Defaults to 8.0.
  final double borderRadius;

  /// Whether the grid should scroll internally. Defaults to true.
  final bool isScrollable;

  /// Creates a [CustomMasonryGrid].
  const CustomMasonryGrid({
    super.key,
    required this.items,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 8.0,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> columns = List.generate(crossAxisCount, (_) => []);

    for (int i = 0; i < items.length; i++) {
      columns[i % crossAxisCount].add(
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: items[i],
        ),
      );
    }

    Widget gridWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(crossAxisCount, (colIndex) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: crossAxisSpacing / 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: columns[colIndex].map((item) {
                return Padding(
                  padding: EdgeInsets.only(bottom: mainAxisSpacing),
                  child: item,
                );
              }).toList(),
            ),
          ),
        );
      }),
    );

    return isScrollable
        ? SingleChildScrollView(padding: padding, child: gridWidget)
        : Padding(padding: padding, child: gridWidget);
  }
}