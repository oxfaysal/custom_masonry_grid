## 1.0.3
* **New Feature: Built-in Shimmer Loading:** Added a dependency-free, customizable shimmer animation using `isLoading` and `shimmerCount` parameters.
* **New Feature: Responsive Layout:** The grid can now automatically calculate the number of columns based on `maxItemWidth` if `crossAxisCount` is not provided.
* **New Feature: Header & Footer Support:** Added `header` and `footer` parameters to easily add widgets above and below the masonry grid.
* **New Feature: Tap Interaction:** Added `onItemTap` callback to handle click events with the specific item index.
* **New Feature: Empty State Support:** Added `emptyState` widget to display custom UI when the item list is empty.
* **Visual Enhancements:** Integrated `AnimatedContainer` for smoother state transitions and `BouncingScrollPhysics` for a premium scroll feel.
* **Refactor:** Internal code restructured for better performance and maintenance.


## 1.0.2
- **Documentation:** Added comprehensive Dartdoc comments for public API elements.
- **Features:** Improved code structure and added repository/issue tracker links in pubspec.yaml.
- **Maintenance:** Updated analysis options for better linting support.

## 1.0.1
* Minor internal improvements.
* Added project preview image in README.
* Added `borderRadius` to customize the corners of grid items.
* Added `isScrollable` parameter to control scrolling behavior.
* Improved layout efficiency with `MainAxisSize.min`.

## 1.0.0
* Initial release.
* Added `CustomMasonryGrid` widget with customizable columns, spacing, and padding.
* Lightweight and dependency-free implementation.