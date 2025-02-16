import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    Key? key,
    required this.food,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color to white
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // Text food details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "\$${food.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          food.description ?? 'No description available',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Food image with borderRadius and default fallback
                  const SizedBox(width: 15),

                  food.imagePath != null && food.imagePath.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            food.imagePath,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.fastfood,
                          size: 100,
                          color: Colors.grey,
                        ),
                ],
              ),
            ),
          ),
          Divider(
            color:
                Theme.of(context).colorScheme.tertiary, // Primary theme color
            endIndent: 25,
            indent: 25,
          ),
        ],
      ),
    );
  }
}
