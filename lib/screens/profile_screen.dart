import 'package:flutter/material.dart';
import 'favorites_screen.dart'; // Import the FavoritesScreen
import 'categories_screen.dart'; // Import the CategoriesScreen
import 'homepage_screen.dart'; // Import the HomePageScreen
import 'package:shared_preferences/shared_preferences.dart'; // Add SharedPreferences import

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3; // Default to 'Profile' tab
  String _selectedLanguage = 'English'; // Default language
  String _email = 'john.doe@example.com'; // Default email

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data on initialization
  }

  // Method to load user data from SharedPreferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString('email') ?? 'john.doe@example.com'; // Update email
    });
  }

  // Method to handle tapping on bottom navigation bar items
  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to HomePageScreen when 'Home' tab is selected
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()),
      );
    } else if (index == 1) {
      // Navigate to FavoritesScreen when 'Favorites' tab is selected
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FavoritesScreen()),
      );
    } else if (index == 2) {
      // Navigate to CategoriesScreen when 'Categories' tab is selected
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
    } else if (index == 3) {
      // Stay on ProfileScreen
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: Row(
          children: [
            const Icon(Icons.person, color: Colors.blue), // Profile icon
            const SizedBox(width: 8),
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 20, // Matching font size
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFFB38A), // Same background color
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: AssetImage('assets/images/modern_sofa.png'),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _email, // Display email only
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            title: Text(
              'Language',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: DropdownButton<String>(
                value: _selectedLanguage,
                underline: SizedBox(), // Removes the default underline
                icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 20), // Adjusted icon size
                iconSize: 20, // Adjusted icon size
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
                items: <String>['English'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20), // Adjusted icon size
              onPressed: () {
                // Navigate to privacy policy
              },
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
          ListTile(
            title: Text(
              'Help Center',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20), // Adjusted icon size
              onPressed: () {
                // Navigate to help center
              },
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed color to black
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20), // Changed color to black
              onPressed: () {
                // Handle logout action
              },
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFFFFB38A),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
