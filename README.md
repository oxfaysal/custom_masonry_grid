# Custom Masonry Grid

A lightweight, reusable, and dependency-free Masonry Grid widget for Flutter. Perfect for creating image galleries or Pinterest-style layouts.



## Features
- **Zero Dependencies:** Pure Flutter code.
- **Customizable:** Control columns, spacing, padding, and border radius easily.
- **Scroll Control:** Toggle internal scrolling for better integration with other scrollable widgets.
- **Dynamic Height:** Automatically adjusts based on the content.

## Preview
![Masonry Grid Demo](https://raw.githubusercontent.com/oxfaysal/custom_masonry_grid/main/assets/masonry_demo.jpg)

## Getting Started

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  custom_masonry_grid: ^1.0.1
```

## Usage

You can easily use the widget by passing a list of widgets to the `items` parameter:

```dart
import 'package:custom_masonry_grid/custom_masonry_grid.dart';

CustomMasonryGrid(
  crossAxisCount: 2,
  borderRadius: 12.0,
  isScrollable: true,
  items: [
    Image.network('[https://example.com/image1.jpg](https://example.com/image1.jpg)'),
    Image.asset('assets/image2.png'),
    Container(height: 150, color: Colors.blue),
  ],
)
```

## Parameters

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **items** | `List<Widget>` | Required | The list of widgets to display in the grid. |
| **crossAxisCount** | `int` | 2 | The number of columns in the grid. |
| **mainAxisSpacing** | `double` | 10.0 | The vertical space between items. |
| **crossAxisSpacing** | `double` | 10.0 | The horizontal space between columns. |
| **padding** | `EdgeInsets` | `EdgeInsets.zero` | The padding around the entire grid. |
| **borderRadius** | `double` | 8.0 | The corner radius for the grid items. |
| **isScrollable** | `bool` | true | Whether the grid should scroll internally. |