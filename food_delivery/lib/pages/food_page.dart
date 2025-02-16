// // import 'package:flutter/material.dart';
// // import 'package:food_delivery/models/food.dart';
// // import 'package:food_delivery/models/cart_itm.dart';
// // import 'package:food_delivery/models/restaurant.dart';

// // class FoodPage extends StatefulWidget {
// //   final Food food;
// //   final Map<Addon, bool> selectedAddons;

// //   FoodPage({super.key, required this.food})
// //       : selectedAddons = {
// //           for (Addon addon in food.availableAddons) addon: false,
// //         };
// //   @override
// //   State<FoodPage> createState() => _FoodPageState();
// // }

// // class _FoodPageState extends State<FoodPage> {
// //   //method to add to cart
// //   void addToCart(Food food, Map<Addon, bool> selectedAddons) {
// //     //close the current food page to go to menu
// //     Navigator.pop(context);
// //     //format the selected addons
// //     List<Addon> currentlySelectedAddons = [];
// //     for (Addon addon in widget.food.availableAddons) {
// //       if (selectedAddons[addon] == true) {
// //         currentlySelectedAddons.add(addon);
// //       }
// //     }
// //     // add to cart
// //     context.read<Restaurant>().addToCart(food,currentlySelectedAddons);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         // title: Text(
// //         //   widget.food.name,
// //         //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //         // ),
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             Hero(
// //               tag: widget.food.imagePath,
// //               child: Stack(
// //                 children: [
// //                   Container(
// //                     height: MediaQuery.of(context).size.height * 0.4,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.only(
// //                         bottomLeft: Radius.circular(24),
// //                         bottomRight: Radius.circular(24),
// //                       ),
// //                       image: DecorationImage(
// //                         image: AssetImage(widget.food.imagePath),
// //                         fit: BoxFit.cover,
// //                       ),
// //                     ),
// //                   ),
// //                   Positioned.fill(
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.only(
// //                           bottomLeft: Radius.circular(24),
// //                           bottomRight: Radius.circular(24),
// //                         ),
// //                         gradient: LinearGradient(
// //                           begin: Alignment.topCenter,
// //                           end: Alignment.bottomCenter,
// //                           colors: [
// //                             Colors.black.withOpacity(0.5),
// //                             Colors.transparent,
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   Positioned(
// //                     bottom: 20,
// //                     left: 20,
// //                     child: Text(
// //                       widget.food.name,
// //                       style: TextStyle(
// //                         fontSize: 34,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(20.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     "Details",
// //                     style: TextStyle(
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.deepOrangeAccent,
// //                     ),
// //                   ),
// //                   SizedBox(height: 8),
// //                   Text(
// //                     "\$${widget.food.price.toString()}",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.grey[800],
// //                     ),
// //                   ),
// //                   SizedBox(height: 16),
// //                   Text(
// //                     widget.food.description,
// //                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
// //                   ),
// //                   SizedBox(height: 20),
// //                   Divider(color: Colors.grey[400], thickness: 1),
// //                   SizedBox(height: 16),
// //                   Text(
// //                     "Add-ons",
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.deepOrangeAccent,
// //                     ),
// //                   ),
// //                   SizedBox(height: 12),
// //                   Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey[100],
// //                       borderRadius: BorderRadius.circular(12),
// //                       border: Border.all(color: Colors.grey[300]!),
// //                     ),
// //                     child: ListView.builder(
// //                       shrinkWrap: true,
// //                       physics: const NeverScrollableScrollPhysics(),
// //                       padding: EdgeInsets.zero,
// //                       itemCount: widget.food.availableAddons.length,
// //                       itemBuilder: (context, index) {
// //                         Addon addon = widget.food.availableAddons[index];
// //                         return CheckboxListTile(
// //                           title: Text(
// //                             addon.name,
// //                             style: TextStyle(color: Colors.grey[800]),
// //                           ),
// //                           subtitle: Text(
// //                             "\$${addon.price.toStringAsFixed(2)}",
// //                             style: TextStyle(color: Colors.grey[500]),
// //                           ),
// //                           value: widget.selectedAddons[addon],
// //                           onChanged: (bool? value) {
// //                             setState(() {
// //                               widget.selectedAddons[addon] = value ?? false;
// //                             });
// //                           },
// //                           checkColor: Colors.white,
// //                           activeColor: Colors.deepOrangeAccent,
// //                           controlAffinity: ListTileControlAffinity.trailing,
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   SizedBox(height: 20),
// //                   Center(
// //                     child: GestureDetector(
// //                       onTap: () =>
// //                           addToCart(widget.food, widget.selectedAddons),
// //               *
// //                       child: Material(
// //                         elevation: 6,
// //                         borderRadius: BorderRadius.circular(30),
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             color: Colors.deepOrangeAccent,
// //                             borderRadius: BorderRadius.circular(30),
// //                           ),
// //                           padding: EdgeInsets.symmetric(
// //                               horizontal: 24, vertical: 12),
// //                           child: Row(
// //                             mainAxisSize: MainAxisSize.min,
// //                             children: [
// //                               Icon(Icons.shopping_cart, color: Colors.white),
// //                               SizedBox(width: 8),
// //                               Text(
// //                                 "Add to Cart",
// //                                 style: TextStyle(
// //                                     color: Colors.white, fontSize: 18),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.only(left: 25, bottom: 20),
// //           child: GestureDetector(
// //             onTap: () => Navigator.pop(context),
// //             child: Material(
// //               elevation: 6,
// //               shape: CircleBorder(),
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   color: Theme.of(context).colorScheme.secondary,
// //                   shape: BoxShape.circle,
// //                 ),
// //                 child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:food_delivery/models/food.dart';
// import 'package:food_delivery/models/restaurant.dart';
// import 'package:provider/provider.dart'; // Ensure to import provider package

// class FoodPage extends StatefulWidget {
//   final Food food;
//   final Map<Addon, bool> selectedAddons;

//   FoodPage({super.key, required this.food})
//       : selectedAddons = {
//           for (Addon addon in food.availableAddons) addon: false,
//         };

//   @override
//   State<FoodPage> createState() => _FoodPageState();
// }

// class _FoodPageState extends State<FoodPage> {
//   // Method to add to cart
//   void addToCart(Food food, Map<Addon, bool> selectedAddons) {
//     // Close the current food page to go to the menu
//     Navigator.pop(context);

//     // Format the selected addons
//     List<Addon> currentlySelectedAddons = [];
//     for (Addon addon in widget.food.availableAddons) {
//       if (selectedAddons[addon] == true) {
//         currentlySelectedAddons.add(addon);
//       }
//     }

//     // Add to cart
//     context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Hero(
//               tag: widget.food.imagePath,
//               child: Stack(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.4,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(24),
//                         bottomRight: Radius.circular(24),
//                       ),
//                       image: DecorationImage(
//                         image: AssetImage(widget.food.imagePath),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(24),
//                           bottomRight: Radius.circular(24),
//                         ),
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.black.withOpacity(0.5),
//                             Colors.transparent,
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 20,
//                     left: 20,
//                     child: Text(
//                       widget.food.name,
//                       style: TextStyle(
//                         fontSize: 34,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Details",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepOrangeAccent,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "\$${widget.food.price.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     widget.food.description,
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                   ),
//                   SizedBox(height: 20),
//                   Divider(color: Colors.grey[400], thickness: 1),
//                   SizedBox(height: 16),
//                   Text(
//                     "Add-ons",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepOrangeAccent,
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.grey[300]!),
//                     ),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       padding: EdgeInsets.zero,
//                       itemCount: widget.food.availableAddons.length,
//                       itemBuilder: (context, index) {
//                         Addon addon = widget.food.availableAddons[index];
//                         return CheckboxListTile(
//                           title: Text(
//                             addon.name,
//                             style: TextStyle(color: Colors.grey[800]),
//                           ),
//                           subtitle: Text(
//                             "\$${addon.price.toStringAsFixed(2)}",
//                             style: TextStyle(color: Colors.grey[500]),
//                           ),
//                           value: widget.selectedAddons[addon],
//                           onChanged: (bool? value) {
//                             setState(() {
//                               widget.selectedAddons[addon] = value ?? false;
//                             });
//                           },
//                           checkColor: Colors.white,
//                           activeColor: Colors.deepOrangeAccent,
//                           controlAffinity: ListTileControlAffinity.trailing,
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () => addToCart(widget.food, widget.selectedAddons),
//                       child: Material(
//                         elevation: 6,
//                         borderRadius: BorderRadius.circular(30),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.deepOrangeAccent,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 24, vertical: 12),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(Icons.shopping_cart, color: Colors.white),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Add to Cart",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 25, bottom: 20),
//           child: GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Material(
//               elevation: 6,
//               shape: CircleBorder(),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.secondary,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart'; // Ensure to import provider package

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons;

  FoodPage({super.key, required this.food})
      : selectedAddons = {
          for (Addon addon in food.availableAddons) addon: false,
        };

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // Method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // Close the current food page to go to the menu
    Navigator.pop(context);

    // Format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // Add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: widget.food.imagePath,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.food.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      widget.food.name,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$${widget.food.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.food.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey[400], thickness: 1),
                  SizedBox(height: 16),
                  Text(
                    "Add-ons",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        Addon addon = widget.food.availableAddons[index];
                        return CheckboxListTile(
                          title: Text(
                            addon.name,
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                          subtitle: Text(
                            "\$${addon.price.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value ?? false;
                            });
                          },
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrangeAccent,
                          controlAffinity: ListTileControlAffinity.trailing,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () =>
                          addToCart(widget.food, widget.selectedAddons),
                      child: Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_cart, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Add to Cart",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
