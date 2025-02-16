import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';

class MyReceiptPage extends StatelessWidget {
  final List<CartItem> cartItems;

  const MyReceiptPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double total = 0.0;
    cartItems.forEach((item) {
      total += item.price; // Calculate total based on item prices
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text(
          'Receipt',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Receipt Details',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            // Information Box (Card)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionTitle('Order Information'),
                    buildInfoText('Order Number: #123456'),
                    buildInfoText('Date: ${DateTime.now().toLocal()}'),
                    const SizedBox(height: 20),
                    buildSectionTitle('Items Ordered'),
                    ...cartItems
                        .map((item) => buildItem(
                            '${item.name} - \$${item.price.toStringAsFixed(2)}'))
                        .toList(),
                    const SizedBox(height: 20),
                    Text(
                      'Total: \$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Payment Details Section (Card)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionTitle('Payment Details'),
                    buildInfoText('Payment Method: Credit Card'),
                    buildInfoText('Card Ending: **** 1234'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Button to go back to the Home screen
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.black54),
      ),
    );
  }

  Widget buildItem(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        item,
        style: const TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }
}
