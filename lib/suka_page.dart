import 'package:flutter/material.dart';
import 'detail_makanan.dart';
import 'kreasi.dart';
import 'profile_page.dart';
import 'home_page.dart';

class SukaPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final Function(Map<String, String>) onRemove;
  final List<Map<String, dynamic>> myRecipes;
  final Function(Map<String, dynamic>) onAddRecipe;
  final Map<String, dynamic> userProfile;
  final void Function(Map<String, dynamic>) onUpdateProfile;

  const SukaPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    required this.onRemove,
    required this.myRecipes,
    required this.onAddRecipe,
    required this.userProfile,
    required this.onUpdateProfile,
  });

  @override
  State<SukaPage> createState() => _SukaPageState();
}

class _SukaPageState extends State<SukaPage> {
  int _selectedIndex = 2;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            savedRecipes: widget.savedRecipes,
            isRecipeSaved: widget.isRecipeSaved,
            onToggleSave: widget.onToggleSave,
            myRecipes: widget.myRecipes,
            onAddRecipe: widget.onAddRecipe,
            userProfile: widget.userProfile,
            onUpdateProfile: widget.onUpdateProfile,
          ),
        ),
        (route) => false,
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => KreasiListPage(
            myRecipes: widget.myRecipes,
            onAddRecipe: widget.onAddRecipe,
            savedRecipes: widget.savedRecipes,
            isRecipeSaved: widget.isRecipeSaved,
            onToggleSave: widget.onToggleSave,
            userProfile: widget.userProfile,
            onUpdateProfile: widget.onUpdateProfile,
          ),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            savedRecipes: widget.savedRecipes,
            isRecipeSaved: widget.isRecipeSaved,
            onToggleSave: widget.onToggleSave,
            isGuest: false,
            onLogout: () {},
            myRecipes: widget.myRecipes,
            onAddRecipe: widget.onAddRecipe,
            userProfile: widget.userProfile,
            onUpdateProfile: widget.onUpdateProfile,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Resep Tersimpan",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3436),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: widget.savedRecipes.isEmpty
                      ? _buildEmptyState()
                      : _buildSavedList(context),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          _buildFloatingBottomBar(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 20),
          Text(
            "Belum ada resep tersimpan",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Simpan resep favoritmu untuk\ncepat mengakses nanti",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedList(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.1,
      ),
      itemCount: widget.savedRecipes.length,
      itemBuilder: (context, index) {
        final recipe = widget.savedRecipes[index];
        return Dismissible(
          key: Key(recipe['name']! + index.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          onDismissed: (direction) {
            widget.onRemove(recipe);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${recipe['name']} dihapus dari favorit'),
                action: SnackBarAction(label: "Batal", onPressed: () {}),
              ),
            );
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailResepLengkap(
                    namaResep: recipe['name']!,
                    imageUrl: recipe['img']!,
                    isRecipeSaved: widget.isRecipeSaved,
                    onToggleSave: widget.onToggleSave,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(recipe['img']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red[400],
                          size: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(
                          recipe['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloatingBottomBar() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 36, 42, 44),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _onNavItemTapped(0),
              child: _bottomNavItem(
                Icons.home_filled,
                "Beranda",
                _selectedIndex == 0,
              ),
            ),
            GestureDetector(
              onTap: () => _onNavItemTapped(1),
              child: _bottomNavItem(
                Icons.receipt_long_rounded,
                "Menu",
                _selectedIndex == 1,
              ),
            ),
            GestureDetector(
              onTap: () => _onNavItemTapped(2),
              child: _bottomNavItem(
                Icons.favorite_border_rounded,
                "Suka",
                _selectedIndex == 2,
              ),
            ),
            GestureDetector(
              onTap: () => _onNavItemTapped(3),
              child: _bottomNavItem(
                Icons.person_outline_rounded,
                "Profil",
                _selectedIndex == 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Colors.amber : Colors.white60, size: 26),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 4,
            width: 4,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
