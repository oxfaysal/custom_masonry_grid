# Custom Masonry Grid

A lightweight, reusable, and dependency-free Masonry Grid widget for Flutter. Perfect for creating image galleries, Pinterest-style layouts, or dynamic content feeds with built-in loading animations.


## Features

- **Zero Dependencies:** Pure Flutter code, no external packages required.
- **Built-in Shimmer:** Smooth loading animation (Gradient-based) without any extra setup.
- **Responsive Design:** Automatically calculates columns based on screen width or fixed count.
- **Header & Footer:** Easily add widgets above or below the grid.
- **Tap Interaction:** Built-in onItemTap callback to handle user clicks with item index.
- **Empty State:** Customizable widget to display when the list is empty.
- **Highly Customizable:** Control spacing, padding, and border radius effortlessly.

## Preview 📸

<p align="center">
  <img src="https://raw.githubusercontent.com/oxfaysal/custom_masonry_grid/main/assets/masonry_demo.png" alt="Custom Masonry Grid Demo" width="100%" />
  
</p>



## Getting Started 🚀

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  custom_masonry_grid: ^1.0.4
```

## Usage 🛠️

#### Basic Implementation

```dart
import 'package:custom_masonry_grid/custom_masonry_grid.dart';

CustomMasonryGrid(
  crossAxisCount: 2,
  items: [
    Image.network('https://picsum.photos/200/300'),
    Image.network('https://picsum.photos/200/400'),
    Container(height: 150, color: Colors.blue),
  ],
)
```
#### Advanced Usage (with Loading & Interaction)

```dart
CustomMasonryGrid(
  isLoading: _myLoadingState, // Shows shimmer when true
  onItemTap: (index) => print("Tapped on index $index"),
  header: Text("Gallery Header", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  footer: Center(child: CircularProgressIndicator()),
  padding: EdgeInsets.all(12),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  items: myItemsList,
)
```

## Parameters

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **items** | `List<Widget>` | Required | The list of widgets to display in the grid. |
| **isLoading** | `bool` | `false` | Set to true to show the built-in shimmer loading effect. |
| **crossAxisCount** | `int?` | `null` | Number of columns. If null, it calculates based on `maxItemWidth`. |
| **onItemTap** | `Function(int)?` | `null` | Callback providing the index of the tapped item. |
| **mainAxisSpacing** | `double` | 10.0 | The vertical space between items in a column. |
| **crossAxisSpacing** | `double` | 10.0 | The horizontal space between columns. |
| **borderRadius** | `double` | 8.0 | The corner radius for each grid item. |
| **maxItemWidth** | `double` | 200.0 | Max width per column for responsive layout calculation. |
| **padding** | `EdgeInsetsGeometry` | `EdgeInsets.zero` | The padding around the entire grid. |
| **header** | `Widget?` | `null` | Optional widget to display at the top of the grid. |
| **footer** | `Widget?` | `null` | Optional widget to display at the bottom of the grid. |
| **emptyState** | `Widget?` | `null` | Widget to show when the list is empty and not loading. |
| **isScrollable** | `bool` | `true` | Whether the grid should scroll internally. |
| **shimmerCount** | `int` | `6` | Number of shimmer placeholders to show during loading. |



## 📧 Contact & Support

If you have any questions, feedback, or run into issues while using `date_snap`, feel free to reach out:

* **Email:** [loomixdev@gmail.com](loomixdev@gmail.com)
* **GitHub:** [https://github.com/oxfaysal](https://github.com/oxfaysal)

I'm happy to help you with any improvements or fixes!
