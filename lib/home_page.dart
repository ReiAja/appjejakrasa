import 'dart:async';
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'detail_makanan.dart';
import 'suka_page.dart';
import 'provinsi_page.dart';
import 'notifikasi.dart';
import 'kreasi.dart';
import 'popular_page.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;
  final List<Map<String, dynamic>> myRecipes;
  final Function(Map<String, dynamic>) onAddRecipe;
  final Map<String, dynamic> userProfile;
  final void Function(Map<String, dynamic>) onUpdateProfile;

  const HomePage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
    required this.myRecipes,
    required this.onAddRecipe,
    required this.userProfile,
    required this.onUpdateProfile,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Banner carousel variables
  int _currentBannerIndex = 0;
  final PageController _bannerPageController = PageController();
  Timer? _bannerTimer;

  // Banner data - 3 gambar yang akan berganti
  final List<Map<String, String>> _bannerData = [
    {
      "image":
          "https://awsimages.detik.net.id/community/media/visual/2023/12/13/masakan-indonesia_169.jpeg?w=600&q=90",
      "title": "Chef's Special",
      "subtitle": "Resep Tradisional\nYang Terlezat",
      "buttonText": "Coba Resep",
    },
    {
      "image":
          "https://www.kemenparekraf.go.id/_next/image?url=https%3A%2F%2Fapi2.kemenparekraf.go.id%2Fstorage%2Fapp%2Fuploads%2Fpublic%2F620%2Fb45%2F62a%2F620b4562adc33870532034.jpg&w=3840&q=75",
      "title": "Promo Mingguan",
      "subtitle": "Diskon 50%\nUntuk Pemesanan Online",
      "buttonText": "Pesan Sekarang",
    },
  ];

  @override
  void initState() {
    super.initState();
    _startBannerAutoScroll();
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerPageController.dispose();
    super.dispose();
  }

  void _startBannerAutoScroll() {
    _bannerTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_bannerPageController.hasClients) {
        if (_currentBannerIndex < _bannerData.length - 1) {
          _currentBannerIndex++;
        } else {
          _currentBannerIndex = 0;
        }
        _bannerPageController.animateToPage(
          _currentBannerIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onBannerPageChanged(int index) {
    setState(() {
      _currentBannerIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SukaPage(
            savedRecipes: widget.savedRecipes,
            isRecipeSaved: widget.isRecipeSaved,
            onToggleSave: widget.onToggleSave,
            onRemove: (recipe) {
              widget.onToggleSave(recipe);
            },
            myRecipes: widget.myRecipes,
            onAddRecipe: widget.onAddRecipe,
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
            isGuest: widget.isGuest,
            onLogout: () {},
            myRecipes: widget.myRecipes,
            onAddRecipe: widget.onAddRecipe,
            userProfile: widget.userProfile,
            onUpdateProfile: widget.onUpdateProfile,
          ),
        ),
      );
    } else if (index == 1) {
      // Navigate to KreasiPage (user's created recipes)
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildHeader(),
                  const SizedBox(height: 25),
                  _buildSearchBar(),
                  const SizedBox(height: 25),
                  _buildBanner(),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Kategori Provinsi"),
                  _buildProvinceCategories(),
                  const SizedBox(height: 30),
                  _buildSectionTitle(
                    "Pencarian Populer",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PopularPage(
                            isRecipeSaved: widget.isRecipeSaved,
                            onToggleSave: widget.onToggleSave,
                          ),
                        ),
                      );
                    },
                  ),
                  _buildPopularGrid(),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Resep Terbaru"),
                  _buildRecentRecipes(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          _buildFloatingBottomBar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 2),
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: widget.isGuest
                      ? Colors.grey[300]
                      : const Color(0xFFFFD54F),
                  child: Icon(
                    widget.isGuest ? Icons.person : Icons.person_outline,
                    color: widget.isGuest ? Colors.grey : Colors.white,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isGuest ? "Selamat Datang" : "Selamat Datang,",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    widget.isGuest ? "User" : (widget.userProfile['name'] ?? 'JAYAA PRATAMA'),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: widget.isGuest
                          ? const Color(0xFFFBC02D)
                          : const Color(0xFF2D3436),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotifikasiPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Cari Resep Nusantara...',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Icon(Icons.search_rounded, color: Colors.amber),
            suffixIcon: Icon(Icons.tune_rounded, color: Colors.grey, size: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: PageView.builder(
              controller: _bannerPageController,
              onPageChanged: _onBannerPageChanged,
              itemCount: _bannerData.length,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      _bannerData[index]['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.amber[200],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.amber[100],
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber[600]?.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _bannerData[index]['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _bannerData[index]['subtitle']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.amber[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              _bannerData[index]['buttonText']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _bannerData.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentBannerIndex == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentBannerIndex == index
                    ? Colors.amber
                    : Colors.amber.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3436),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              "Lihat Semua",
              style: TextStyle(
                fontSize: 12,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProvinceCategories() {
    final List<Map<String, dynamic>> provinces = [
      {"name": "Jawa", "icon": Icons.landscape, "color": Colors.amber},
      {"name": "Sumatera", "icon": Icons.waves, "color": Colors.green},
      {"name": "Bali", "icon": Icons.temple_hindu, "color": Colors.orange},
      {"name": "Sulawesi", "icon": Icons.anchor, "color": Colors.blue},
      {"name": "Papua", "icon": Icons.forest, "color": Colors.brown},
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: provinces.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getProvincePage(
                    provinces[index]['name'],
                    savedRecipes: widget.savedRecipes,
                    isRecipeSaved: widget.isRecipeSaved,
                    onToggleSave: widget.onToggleSave,
                    isGuest: widget.isGuest,
                  ),
                ),
              );
            },
            child: Container(
              width: 85,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: (provinces[index]['color'] as Color).withOpacity(
                        0.1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      provinces[index]['icon'],
                      color: provinces[index]['color'] as Color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    provinces[index]['name'],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularGrid() {
    final List<Map<String, String>> populars = [
      {
        "name": "Gado-gado",
        "img": "https://assets.unileversolutions.com/recipes-v2/257673.jpg",
      },
      {
        "name": "Rawon",
        "img":
            "https://assets.dapurumami.com/backup/dapurumami-test/recipe/Resep%20Rawon-YhEGKU1669005458.webp",
      },
      {
        "name": "Sate Padang",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe0CwCbJvDKae_j_H1HTFKESbNMGAtZA9x2A&s",
      },
      {
        "name": "Pempek",
        "img":
            "https://asset.tribunnews.com/uKZ6TSI1W-JMSbfiBt5lH3r7_J4=/1200x675/filters:upscale():quality(30):format(webp):focal(0.5x0.5:0.5x0.5)/jogja/foto/bank/originals/Pempek-Palembang.jpg",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.1,
        ),
        itemCount: populars.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailResepLengkap(
                    namaResep: populars[index]['name']!,
                    imageUrl: populars[index]['img']!,
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
                  image: NetworkImage(populars[index]['img']!),
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
                padding: const EdgeInsets.all(12),
                alignment: Alignment.bottomLeft,
                child: Text(
                  populars[index]['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentRecipes() {
    final List<Map<String, String>> recipes = [
      {
        "name": "Gulai Ikan Patin",
        "img":
            "https://img-global.cpcdn.com/recipes/6290cee58b9185b4/400x400cq80/photo.jpg",
      },
      {
        "name": "Soto Lamongan",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKISacqQruWQNioCoYuHplsm95w3TiJ2wOrQ&s",
      },
      {
        "name": "Ayam Betutu",
        "img":
            "https://buckets.sasa.co.id/v1/AUTH_Assets/Assets/p/website/medias/page_medias/resep_ayam_betutu.jpg",
      },
      {
        "name": "Papeda",
        "img":
            "https://upload.wikimedia.org/wikipedia/commons/0/01/Papeda%2C_Kuah_Kuning%2C_Ikan_Tude_Bakar_2.jpg",
      },
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailResepLengkap(
                    namaResep: recipes[index]['name']!,
                    imageUrl: recipes[index]['img']!,
                    isRecipeSaved: widget.isRecipeSaved,
                    onToggleSave: widget.onToggleSave,
                  ),
                ),
              );
            },
            child: Container(
              width: 160,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(recipes[index]['img']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      recipes[index]['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
