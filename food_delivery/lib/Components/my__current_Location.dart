import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  // Function to show a location search dialog
  void showLocationSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Location"),
        content: const TextField(
          decoration: InputDecoration(hintText: "Search address..."),
        ),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          // Save button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Deliver now text
          Text(
            "Deliver now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8), // Optional spacing

          // Gesture detector for clickable address
          GestureDetector(
            onTap: () => showLocationSearchDialog(context),
            child: Row(
              children: [
                // Address text
                Text(
                  "1234 Sousse, Tunisia",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5), // Optional spacing
                // Dropdown icon
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
