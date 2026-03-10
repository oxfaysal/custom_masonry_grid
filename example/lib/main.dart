import 'package:flutter/material.dart';
import 'package:custom_masonry_grid/custom_masonry_grid.dart';

void main() {
  runApp(const MaterialApp(home: ExampleScreen()));
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Masonry Grid Example")),
      body: CustomMasonryGrid(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        items: List.generate(10, (index) {
          return Container(
            height: (index % 2 == 0) ? 150 : 250,
            decoration: BoxDecoration(
              color: Colors.blue[(index + 1) * 100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text("Item $index")),
          );
        }),
      ),
    );
  }
}