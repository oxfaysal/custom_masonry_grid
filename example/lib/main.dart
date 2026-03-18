import 'package:flutter/material.dart';
import 'package:custom_masonry_grid/custom_masonry_grid.dart'; 

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExampleScreen(),
  ));
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 3 second por shimmer bondho hoye real items dekhabe
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Masonry Grid Pro Example"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: CustomMasonryGrid(
        // Core Config
        isLoading: _isLoading,
        crossAxisCount: 2, // 2ta column thakbe
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        padding: const EdgeInsets.all(12),
        borderRadius: 15.0, // Beshi rounded looker jonno
        
        // Header & Footer Example
        header: const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Explore Your Gallery",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        footer: const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(child: Text("End of the list ✨")),
        ),

        // Click interaction
        onItemTap: (index) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Tapped on Item $index")),
          );
        },

        // Real Items
        items: List.generate(12, (index) {
          return Container(
            // Masonry looker jonno height vary kora hoyeche
            height: (index % 3 == 0) ? 280 : (index % 2 == 0 ? 180 : 220),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image Placeholder
                Expanded(
                  child: Container(
                    color: Colors.blue[(index + 1) * 100 % 900],
                    child: const Icon(Icons.image, color: Colors.white, size: 40),
                  ),
                ),
                // Text Info
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Creative Item $index",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}