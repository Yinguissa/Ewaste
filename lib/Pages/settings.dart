import 'package:ewaste_susta/Pages/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Colors/MyColors.dart';
import 'Tashboard.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // To track the current theme mode
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors().verte,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Tashboard()));
                },
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: MyColors().blanc,
                  size: 45,
                ),
              ),
              Text(
                "Settings",
                style: TextStyle(
                    fontSize: 16,
                    color: MyColors().blanc,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.settings,
                color: MyColors().blanc,
                size: 45,
              ),
            ],
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/salam.jpeg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Abdoul Sisawo", // Replace with the user's name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "E-Waste Settings", // Customize the subtitle
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),

            // Dark Mode Option
            ListTile(
              leading: const Icon(Icons.brightness_6, color: Colors.teal),
              title: const Text("Dark Mode"),
              subtitle: const Text("Toggle between light and dark mode"),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    _isDarkMode = value;
                    // Apply the theme change
                    _toggleTheme(value);
                  });
                },
                activeColor: Colors.teal,
              ),
            ),
            const Divider(),

            // Settings Options
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.teal),
              title: const Text("Notifications"),
              subtitle: const Text("Enable or disable notifications"),
              trailing: Switch(
                value: true, // Example: Switch on
                onChanged: (bool value) {},
                activeColor: Colors.teal,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.teal),
              title: const Text("Language"),
              subtitle: const Text("Select preferred language"),
              onTap: () {
                // Add functionality to change language
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.teal),
              title: const Text("Help & Support"),
              onTap: () {
                // Navigate to Help & Support section
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.teal),
              title: const Text("Account Settings"),
              onTap: () {
                // Navigate to account settings
              },
            ),
            const Divider(),

            // Logout Option
            GestureDetector(
              onTap: ()async{
                await EasyLoading.show(status: 'Log Out Processing...');
                await Future.delayed(Duration(seconds: 3));
                await EasyLoading.dismiss();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Firstpage()));
              },
              child: ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.red),
                title: const Text("Log Out"),
                onTap: () {
                  // Log out functionality
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10),
        width: 60,
        height: 40,
        color: MyColors().verte,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tashboard()));
              },
              child: Icon(
                Icons.home,
                color: MyColors().blanc,
                size: 35,
              ),
            ),
            Icon(
              Icons.person,
              color: MyColors().blanc,
              size: 35,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings()));
              },
              child: Icon(
                Icons.settings,
                color: MyColors().blanc,
                size: 35,
              ),
            ),
            Icon(
              Icons.help,
              color: MyColors().blanc,
              size: 35,
            )
          ],
        ),
      ),
    );
  }

  // Method to toggle between light and dark mode
  void _toggleTheme(bool isDarkMode) {
    if (isDarkMode) {
      // Set the theme to dark mode
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      setState(() {
        // Update any UI based on dark mode settings
      });
    } else {
      // Set the theme to light mode
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      setState(() {
        // Update any UI based on light mode settings
      });
    }
  }
}
