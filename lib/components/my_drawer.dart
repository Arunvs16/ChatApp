import 'package:chat_app/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child:
                      // message icon
                      Center(
                    child: Icon(
                      Icons.message,
                      color: Theme.of(context).colorScheme.primary,
                      size: 60,
                    ),
                  ),
                ),
                // home button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    title: Text(
                      'H O M E',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // settings button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    title: Text(
                      'S E T T I N G S',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    leading: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(),));
                    },
                  ),
                ),
              ],
            ),

            // logout button
            Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                  child: ListTile(
                    title: Text(
                      'L O G O U T',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    leading: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
