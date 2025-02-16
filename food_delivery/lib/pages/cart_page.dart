import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/Components/my_cart_tile.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:food_delivery/Components/my_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 2,
            foregroundColor: Colors.white,
            actions: [
              // Clear cart button
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          'Are you sure you want to clear the cart?'),
                      content: const Text('This action cannot be undone.'),
                      actions: [
                        // Cancel Button
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        // Yes Button
                        TextButton(
                          onPressed: () {
                            restaurant
                                .clearCart(); // Call your clear cart method
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes, Clear Cart'),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          body: Column(
            children: [
              // List of cart items
              userCart.isEmpty
                  ? const Center(child: Text('Your cart is empty.'))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final CartItem item = userCart[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: MyCartTile(
                                cartItem:
                                    item), // Using MyCartTile component here
                          );
                        },
                      ),
                    ),
              // Button to pay
              userCart.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MyButton(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()),
                        ),
                        text: "Go to Checkout",
                      ),
                    )
                  : const SizedBox.shrink(), // No button if cart is empty
            ],
          ),
        );
      },
    );
  }
}
