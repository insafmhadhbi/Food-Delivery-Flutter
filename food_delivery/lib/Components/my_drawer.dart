import 'package:flutter/material.dart';
import 'package:food_delivery/Components/my_drawer_tile.dart';
import 'package:food_delivery/pages/Settings_Page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // App logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_clock_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 20), // Space below the icon

          const Divider(), // Divider for separating the sections

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // Home ListTile
          MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Settings ListTile
          MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(), // Proper use of Spacer widget

          // Logout ListTile
          MyDrawerTile(
            text: 'L O G O U T',
            icon: Icons.logout,
            onTap: () {
              // Add logout logic here
            },
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
