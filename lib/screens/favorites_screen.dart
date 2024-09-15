import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 1; // Set the default selected index to 'Favorites'

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic if necessary
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.favorite, color: Colors.blue),
            const SizedBox(width: 8),
            Text(
              'Favorites',
              style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFFB38A), // Lighter version of #FFB38A
        elevation: 0,
      ),
      body: Container(
        color: Colors.orange[100], // Background color
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            // Sample favorite items (Make sure the image paths are correct)
            _buildFavoriteCard('assets/images/modern_sofa.png', 'Modern Sofa', '\$300'),
            _buildFavoriteCard('assets/images/luxury_bed.png', 'Luxury Bed', '\$450'),
            _buildFavoriteCard('assets/images/dining_table.png', 'Dining Table Set', '\$200'),
          ],
        ),
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

  Widget _buildFavoriteCard(String imagePath, String title, String price) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: ListTile(
        leading: Image.asset(imagePath, fit: BoxFit.cover),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle, color: Colors.red), // Option to remove from favorites
          onPressed: () {
            // Implement remove from favorites functionality
          },
        ),
      ),
    );
  }
}
