class CustomMasonryGrid extends StatelessWidget {
  final List<Widget> items;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool isScrollable; 

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