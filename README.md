# Coffee Shop
A Flutter app to display products ,manage orders and sales of a coffee shop, It is based on local database,
Cart and contact us screens are provided...

## State Management
- Getx 

## Directory Structure
```
📂lib
 │───main.dart  
 │───📂dummy_data
 |    └──dummy_data.dart
 │───📂consts  
 |   │──app_constants.dart
 |   └──global_constants.dart  
 │────📂model
 |    └──drink_model.dart
 └────📂view
 |    │───📂screens
 |    |   |──cart_screen.dart
 |    |   |──auth_screen.dart
 |    |   |──home_screen.dart
 |    |   |──splash_screen.dart
 |    |   |──coffee_screen.dart
 |    |   |──juice_screen.dart
 |    |   |──tea_screen.dart
 |    |   |──order_screen.dart
 |    |   |──search_screen.dart
 |    |   └──contactus_screen.dart
 |    └───📂widget
 |        |──cart_item_widget.dart
 │        |──drawer_widget.dart
 |        └──greatday_widget.dart
 └────📂controllers
      └──📂bindings
      |   |──auth_binding.dart
      |   |──cart_binding.dart
      |   |──coffee_binding.dart
      |   |──juice_binding.dart
      |   |──order_binding.dart
      |   |──search_binding.dart
      |   |──splash_binding.dart
      |   └──tea_binding.dart
      │───auth_controller.dart
      │───cart_controller.dart
      │───coffee_controller.dart
      │───juice_controller.dart
      │───order_controller.dart
      │───search_controller.dart
      │───splash_controller.dart
      └──tea_controller.dart
      
```
