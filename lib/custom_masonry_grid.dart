library custom_masonry_grid;

import 'package:flutter/material.dart';

/// A reusable Masonry Grid widget that distributes items into columns.
class CustomMasonryGrid extends StatelessWidget {
  /// List of widgets to display in the grid.
  final List<Widget> items;

  /// Number of columns to display.
  final int crossAxisCount;

  /// Vertical spacing between items.
  final double mainAxisSpacing;

  /// Horizontal spacing between columns.
  final double crossAxisSpacing;

  /// Padding around the entire grid.
  final EdgeInsetsGeometry padding;

  const CustomMasonryGrid({
    super.key,
    required this.items,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    // Distributing items into columns based on index
    List<List<Widget>> columns = List.generate(crossAxisCount, (_) => []);
    
    for (int i = 0; i < items.length; i++) {
      columns[i % crossAxisCount].add(items[i]);
    }

    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(crossAxisCount, (colIndex) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: crossAxisSpacing / 2,
              ),
              child: Column(
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
      ),
    );
  }
}