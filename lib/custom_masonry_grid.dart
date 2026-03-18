import 'package:flutter/material.dart';

/// A lightweight, reusable, and dependency-free Masonry Grid widget.
/// 
/// Features:
/// - Responsive Column Calculation
/// - Built-in Shimmer Loading Animation
/// - Header and Footer Support
/// - Custom Empty State
/// - Tap Callbacks and Hover Animation logic
class CustomMasonryGrid extends StatefulWidget {
  /// The list of widgets to display in the grid.
  final List<Widget> items;

  /// Optional: Fixed number of columns. If null, it calculates based on [maxItemWidth].
  final int? crossAxisCount;

  /// Vertical spacing between items. Defaults to 10.0.
  final double mainAxisSpacing;

  /// Horizontal spacing between columns. Defaults to 10.0.
  final double crossAxisSpacing;

  /// Padding around the entire grid.
  final EdgeInsetsGeometry padding;

  /// Border radius for each grid item. Defaults to 8.0.
  final double borderRadius;

  /// Whether the grid should scroll internally. Defaults to true.
  final bool isScrollable;

  /// Trigger to show the shimmer loading state.
  final bool isLoading;

  /// Number of shimmer placeholders to show during loading.
  final int shimmerCount;

  /// Optional widget that appears at the very top.
  final Widget? header;

  /// Optional widget that appears at the very bottom.
  final Widget? footer;

  /// Widget to display when [items] is empty and [isLoading] is false.
  final Widget? emptyState;

  /// Callback function returning the index of the tapped item.
  final Function(int index)? onItemTap;

  /// Maximum width allowed per column for responsive layout calculation.
  final double maxItemWidth;

  const CustomMasonryGrid({
    super.key,
    required this.items,
    this.crossAxisCount,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 8.0,
    this.isScrollable = true,
    this.isLoading = false,
    this.shimmerCount = 6,
    this.header,
    this.footer,
    this.emptyState,
    this.onItemTap,
    this.maxItemWidth = 200.0,
  });

  @override
  State<CustomMasonryGrid> createState() => _CustomMasonryGridState();
}

class _CustomMasonryGridState extends State<CustomMasonryGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    // Shimmer animation controller for the sliding gradient effect
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show empty state if not loading and no items
    if (!widget.isLoading && widget.items.isEmpty) {
      return widget.emptyState ?? const Center(child: Text("No items found"));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate columns: if crossAxisCount is null, use maxItemWidth
        int columnsToDisplay = widget.crossAxisCount ??
            (constraints.maxWidth / widget.maxItemWidth).floor().clamp(1, 10);

        Widget content = _buildGridContent(columnsToDisplay);

        return widget.isScrollable
            ? SingleChildScrollView(
                padding: widget.padding,
                physics: const BouncingScrollPhysics(),
                child: content,
              )
            : Padding(padding: widget.padding, child: content);
      },
    );
  }

  /// Builds the main grid structure including Header, Footer, and Items/Shimmer
  Widget _buildGridContent(int columns) {
    return Column(
      children: [
        if (widget.header != null) widget.header!,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(columns, (colIndex) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.crossAxisSpacing / 2),
                child: Column(
                  children: widget.isLoading
                      ? _buildShimmerColumn(colIndex, columns)
                      : _buildItemColumn(colIndex, columns),
                ),
              ),
            );
          }),
        ),
        if (widget.footer != null) widget.footer!,
      ],
    );
  }

  /// Distributes real items into specific columns based on index % totalColumns
  List<Widget> _buildItemColumn(int colIndex, int totalCols) {
    List<Widget> columnWidgets = [];
    for (int i = 0; i < widget.items.length; i++) {
      if (i % totalCols == colIndex) {
        columnWidgets.add(
          Padding(
            padding: EdgeInsets.only(bottom: widget.mainAxisSpacing),
            child: GestureDetector(
              onTap: widget.onTapWrapper(i),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: widget.items[i],
              ),
            ),
          ),
        );
      }
    }
    return columnWidgets;
  }

  /// Generates shimmer placeholders for the loading state
  List<Widget> _buildShimmerColumn(int colIndex, int totalCols) {
    int itemsInThisCol = (widget.shimmerCount / totalCols).ceil();
    return List.generate(itemsInThisCol, (index) {
      // Alternating heights to mimic Masonry variation
      double height = (index + colIndex) % 2 == 0 ? 200 : 140;
      return _ShimmerBox(
        controller: _shimmerController,
        height: height,
        borderRadius: widget.borderRadius,
        margin: widget.mainAxisSpacing,
      );
    });
  }

  VoidCallback? onTapWrapper(int index) {
    return widget.onItemTap != null ? () => widget.onItemTap!(index) : null;
  }
}

/// Internal helper widget to render the Shimmer animation
class _ShimmerBox extends StatelessWidget {
  final Animation<double> controller;
  final double height;
  final double borderRadius;
  final double margin;

  const _ShimmerBox({
    required this.controller,
    required this.height,
    required this.borderRadius,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          height: height,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: margin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
                Color(0xFFEBEBF4),
                Color(0xFFF4F4F4),
                Color(0xFFEBEBF4),
              ],
              stops: [
                controller.value - 0.3,
                controller.value,
                controller.value + 0.3,
              ],
            ),
          ),
        );
      },
    );
  }
}