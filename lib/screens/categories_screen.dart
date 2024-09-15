import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.category, color: Colors.blue),
            const SizedBox(width: 8),
            Text(
              'Categories',
              style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFFB38A), // Lighter version of #FFB38A
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          shrinkWrap: true, // Makes GridView use only as much space as needed
          physics: const NeverScrollableScrollPhysics(), // Disable GridView's internal scrolling
          children: <Widget>[
            _buildCategoryTile(Icons.weekend, 'Living Room'),
            _buildCategoryTile(Icons.king_bed, 'Bedroom'),
            _buildCategoryTile(Icons.restaurant, 'Dining Room'),
            _buildCategoryTile(Icons.kitchen, 'Kitchen'),
            _buildCategoryTile(Icons.work, 'Office'),
            _buildCategoryTile(Icons.park, 'Outdoor'),
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
        currentIndex: 2, // Highlights the 'Categories' item
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFFFFB38A),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Helper method to build category tiles
  Widget _buildCategoryTile(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.orange[800]),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
