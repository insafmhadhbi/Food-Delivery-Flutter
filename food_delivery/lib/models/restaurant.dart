import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:food_delivery/models/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, crisp lettuce, fresh tomato, pickles, and onions, served on a toasted bun.",
      imagePath: "lib/images/food/burgers/classic_cheeseburge.webp",
      price: 7.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.49),
      ],
    ),
    Food(
      name: "Double Bacon Burger",
      description:
          "A double beef patty stacked with crispy bacon, melted cheddar, lettuce, and tomato, served with BBQ sauce.",
      imagePath: "lib/images/food/burgers/double_bacon_burger.jpg",
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra bacon", price: 1.99),
        Addon(name: "Onion rings", price: 2.49),
      ],
    ),
    Food(
      name: "Mushroom Swiss Burger",
      description:
          "A beef patty topped with sautéed mushrooms, Swiss cheese, and garlic aioli, served on a toasted bun.",
      imagePath: "lib/images/food/burgers/mushroom_swiss_burger.jpg",
      price: 8.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra mushrooms", price: 1.00),
        Addon(name: "Truffle mayo", price: 0.99),
      ],
    ),
    Food(
      name: "Spicy Jalapeno Burger",
      description:
          "A spicy beef patty with jalapenos, pepper jack cheese, lettuce, and spicy mayo on a toasted bun.",
      imagePath: "lib/images/food/burgers/spicy_jalapeno_burger.jpg",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra jalapenos", price: 0.99),
        Addon(name: "Hot sauce", price: 0.50),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A flavorful plant-based patty with lettuce, tomato, onions, and avocado on a multigrain bun.",
      imagePath: "lib/images/food/burgers/veggie_burger.jpg",
      price: 7.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Guacamole", price: 1.50),
        Addon(name: "Vegan cheese", price: 0.99),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Lava Cake",
      description:
          "A rich, warm chocolate cake with a molten chocolate center, served with a scoop of vanilla ice cream.",
      imagePath: "lib/images/food/desserts/chocolate_lava_cake.jpg",
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream", price: 1.50),
        Addon(name: "Whipped cream", price: 0.50),
      ],
    ),
    Food(
      name: "Strawberry Cheesecake",
      description:
          "A creamy cheesecake with a graham cracker crust, topped with fresh strawberry sauce.",
      imagePath: "lib/images/food/desserts/strawberry_cheesecake.jpg",
      price: 6.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra strawberries", price: 1.00),
        Addon(name: "Whipped cream", price: 0.50),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          "A classic Italian dessert with layers of espresso-soaked ladyfingers, mascarpone cream, and cocoa.",
      imagePath: "lib/images/food/desserts/tiramisu.jpg",
      price: 6.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cocoa powder", price: 0.50),
        Addon(name: "Whipped cream", price: 0.50),
      ],
    ),
    Food(
      name: "Apple Pie",
      description:
          "A warm apple pie with a flaky crust, served with vanilla ice cream on the side.",
      imagePath: "lib/images/food/desserts/apple_pie.jpg",
      price: 5.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra ice cream", price: 1.50),
        Addon(name: "Caramel drizzle", price: 0.50),
      ],
    ),
    Food(
      name: "Brownie Sundae",
      description:
          "A warm chocolate brownie topped with vanilla ice cream, whipped cream, and chocolate syrup.",
      imagePath: "lib/images/food/desserts/brownie_sundae.jpg",
      price: 6.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra brownie", price: 1.50),
        Addon(name: "Sprinkles", price: 0.50),
      ],
    ),

    // Drinks
    Food(
      name: "Fresh Lemonade",
      description:
          "A refreshing lemonade made with freshly squeezed lemons and just the right amount of sweetness.",
      imagePath: "lib/images/food/drinks/fresh_lemonade.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint", price: 0.50),
        Addon(name: "Extra ice", price: 0.20),
      ],
    ),
    Food(
      name: "Iced Coffee",
      description:
          "A smooth, cold brew coffee served over ice, with options for milk and sweeteners.",
      imagePath: "lib/images/food/drinks/iced_coffee.jpg",
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vanilla syrup", price: 0.50),
        Addon(name: "Extra shot of espresso", price: 1.50),
      ],
    ),
    Food(
      name: "Mango Smoothie",
      description:
          "A refreshing blend of mango, yogurt, and honey, perfect for a hot day.",
      imagePath: "lib/images/food/drinks/mango_smoothie.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein powder", price: 1.00),
        Addon(name: "Chia seeds", price: 0.75),
      ],
    ),
    Food(
      name: "Herbal Iced Tea",
      description:
          "A refreshing blend of hibiscus, chamomile, and mint, served over ice.",
      imagePath: "lib/images/food/drinks/herbal_iced_tea.jpg",
      price: 3.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon", price: 0.50),
        Addon(name: "Honey", price: 0.50),
      ],
    ),
    Food(
      name: "Hot Chocolate",
      description:
          "A rich and creamy hot chocolate topped with whipped cream and marshmallows.",
      imagePath: "lib/images/food/drinks/hot_chocolate.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Marshmallows", price: 0.50),
        Addon(name: "Whipped cream", price: 0.50),
      ],
    ),

    // Salads
    Food(
      name: "Greek Salad",
      description:
          "A fresh salad with cucumbers, tomatoes, red onions, Kalamata olives, and feta cheese, drizzled with olive oil.",
      imagePath: "lib/images/food/salades/greek_salad.jpg",
      price: 7.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce, croutons, Parmesan cheese, and Caesar dressing, with an option to add grilled chicken.",
      imagePath: "lib/images/food/salades/caesar_salad.jpg",
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Bacon bits", price: 1.50),
      ],
    ),
    Food(
      name: "Caprese Salad",
      description:
          "Fresh tomatoes, mozzarella, and basil, drizzled with balsamic glaze and olive oil.",
      imagePath: "lib/images/food/salades/caprese_salad.jpg",
      price: 6.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Balsamic vinegar", price: 0.50),
        Addon(name: "Extra mozzarella", price: 1.00),
      ],
    ),
    Food(
      name: "Spinach Avocado Salad",
      description:
          "Baby spinach, avocado, cherry tomatoes, and red onions, drizzled with lemon vinaigrette.",
      imagePath: "lib/images/food/salades/spinach_avocado_salad.jpg",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Hard-boiled egg", price: 1.00),
        Addon(name: "Grilled salmon", price: 4.99),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description:
          "A healthy mix of quinoa, cucumbers, tomatoes, and feta cheese, tossed in a lemon-olive oil dressing.",
      imagePath: "lib/images/food/salades/quinoa_salad.jpg",
      price: 8.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocado", price: 1.99),
        Addon(name: "Hummus", price: 1.50),
      ],
    ),

    // Sides
    Food(
      name: "Greek Potato Salad",
      description:
          "Crispy golden fries, lightly salted, perfect as a side dish.",
      imagePath: "lib/images/food/sides/Greek-Potato-Salad-Patatosalata.jpg",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.99),
        Addon(name: "Chili", price: 1.50),
      ],
    ),
    Food(
      name: "Cold Noodle Salad",
      description:
          "Crispy fried onion rings, served with a side of ranch dipping sauce.",
      imagePath: "lib/images/food/sides/cold_noodle_salad.jpg",
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra ranch", price: 0.50),
        Addon(name: "BBQ sauce", price: 0.50),
      ],
    ),
    Food(
      name: "French Fries",
      description: "Crispy, golden fries, served with a side of ketchup.",
      imagePath: "lib/images/food/sides/french_fries.jpg",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.99),
        Addon(name: "Chili", price: 1.50),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Crispy onion rings served with a side of BBQ sauce.",
      imagePath: "lib/images/food/sides/onion_rings.jpg",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra BBQ sauce", price: 0.50),
        Addon(name: "Ranch dip", price: 0.50),
      ],
    ),
    Food(
      name: "Coleslaw",
      description:
          "A tangy and creamy coleslaw made with fresh cabbage and carrots.",
      imagePath: "lib/images/food/sides/coleslaw.jpg",
      price: 1.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra dressing", price: 0.50),
        Addon(name: "Jalapenos", price: 0.50),
      ],
    ),
  ];

// G E T T E R S
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // O P E R A T I O N S
  final List<CartItem> _cart = [];

  // Add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // Check if the item is already in the cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      // If the item already exists, increment the quantity
      cartItem.quantity++;
    } else {
      // If it doesn't exist, create a new CartItem and add it to the cart
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
  }

  // Remove from cart
  void removeFromCart(CartItem item) {
    int cartIndex = _cart.indexOf(item); // Get the index of the item

    if (cartIndex != -1) {
      // If the item exists in the cart
      if (_cart[cartIndex].quantity > 1) {
        // If quantity is greater than 1, decrement the quantity
        _cart[cartIndex].quantity--;
      } else {
        // If quantity is 1, remove the item from the cart
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // Get total price of cart
  double get totalPrice {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // Get total number of items in cart
  int getTotalItemsCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
 // H E L P E R S
  // Generate a receipt
  String generateReceipt() {
    String receipt = "Receipt:\n\n";
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      String addonsSummary = formatAddons(cartItem.selectedAddons);
      String formattedAddons = addonsSummary.isNotEmpty
          ? " Addons: $addonsSummary"
          : "";
      double itemPrice = itemTotal + cartItem.selectedAddons.fold(0.0,
          (previousValue, addon) => previousValue + addon.price);
      total += itemPrice * cartItem.quantity;
      receipt += "${cartItem.food.name} x${cartItem.quantity} - ${formatMoney(itemPrice)}$formattedAddons\n";
    }

    receipt += "\nTotal: ${formatMoney(total)}";
    return receipt;
  }

  // Format double value into money
  String formatMoney(double value) {
    return '\$${value.toStringAsFixed(2)}';
  }

  // Format list of addons into a string summary
  String formatAddons(List<Addon> addons) {
    return addons.map((addon) => addon.name).join(', ');
  }
}


