import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/Components/my_quantity_selector.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Softer shadow
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Food image
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12), // Rounded corners for image
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // Name and price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // Larger font for food name
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(
                          height: 4), // Less space between name and price
                      Text(
                        "\$${cartItem.food.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16, // Larger font for price
                        ),
                      ),
                    ],
                  ),
                ),

                // Quantity selector
                QuantitySelector(
                  quantity: cartItem.quantity,
                  food: cartItem.food,
                  onDecrement: () {
                    restaurant.removeFromCart(cartItem);
                  },
                  onIncrement: () {
                    restaurant.addToCart(
                        cartItem.food, cartItem.selectedAddons);
                  },
                ),
              ],
            ),

            // Addons
            if (cartItem.selectedAddons.isNotEmpty) ...[
              const SizedBox(height: 8), // Space before addons
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                      right: 8.0), // Allow for horizontal scrolling
                  children: cartItem.selectedAddons.map((addon) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color for addons
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1),
                        borderRadius:
                            BorderRadius.circular(30), // StadiumBorder effect
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.1), // Softer shadow
                            blurRadius: 6, // Shadow blur radius
                            offset: const Offset(0, 2), // Shadow offset
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6), // More padding
                      child: Row(
                        children: [
                          // Optional: Add an icon for add-ons
                          Icon(Icons.check_circle,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 4),
                          // Addon name
                          Text(
                            addon.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.w500, // Medium weight for add-ons
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Addon price
                          Text(
                            "\$${addon.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
