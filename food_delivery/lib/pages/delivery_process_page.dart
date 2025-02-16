
import 'package:flutter/material.dart';
import 'package:food_delivery/Components/my_recept.dart'; // Import the receipt page

class DeliveryProcessPage extends StatelessWidget {
  const DeliveryProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Delivery Process'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your order is being processed. You will receive a notification once the delivery is on the way.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // Receipt Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the receipt page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyReceiptPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Receipt Here...',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
