import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'suka_page.dart';

class KreasikuPage extends StatefulWidget {
  const KreasikuPage({Key? key}) : super(key: key);

  @override
  State<KreasikuPage> createState() => _KreasikuPageState();
}

class _KreasikuPageState extends State<KreasikuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Recipe data management
  final List<Map<String, dynamic>> draftRecipes = [
    {
      'id': '1',
      'name': 'Nasi Pecel',
      'image':
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
      'time': '45 Menit',
      'difficulty': 'Mudah',
      'category': 'Makanan',
      'status': 'draft',
    },
  ];
  final List<Map<String, dynamic>> inProgressRecipes = [
    {
      'id': '2',
      'name': 'Nasi Pecel',
      'image':
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
      'time': '45 Menit',
      'status': 'in_progress',
      'progress': 'Sedang dalam proses peninjauan',
    },
  ];
  final List<Map<String, dynamic>> publishedRecipes = [
    {
      'id': '3',
      'name': 'Nasi Pecel',
      'image':
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
      'time': '45 Menit',
      'difficulty': 'Mudah',
      'author': 'Satria Wijaya',
      'views': '2k rb',
      'likes': '44',
      'publishDate': 'Hari ini',
      'uploadInfo': 'Baru diupload\n10 menit yang lalu',
      'status': 'published',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addRecipe(Map<String, dynamic> recipe) {
    setState(() {
      draftRecipes.add(recipe);
    });
  }

  void _uploadRecipe(Map<String, dynamic> recipe) {
    setState(() {
      draftRecipes.removeWhere((r) => r['id'] == recipe['id']);
      recipe['status'] = 'in_progress';
      recipe['progress'] = 'Sedang dalam proses peninjauan';
      inProgressRecipes.add(recipe);
      _tabController.animateTo(1);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Resep berhasil diupload dan sedang ditinjau'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                _buildNavbar(),
                _buildTabs(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildDraftTab(),
                      _buildInProgressTab(),
                      _buildPublishedTab(),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          _buildFloatingBottomNavBar(),
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        KreasiResepPage(onRecipeCreated: _addRecipe),
                  ),
                );
              },
              backgroundColor: Colors.amber,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBottomNavBar() {
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
              onTap: () => Navigator.pop(context),
              child: _bottomNavItem(Icons.home_filled, "Beranda", false),
            ),
            _bottomNavItem(Icons.receipt_long_rounded, "Menu", true),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SukaPage(
                      savedRecipes: const [],
                      isRecipeSaved: (_) => false,
                      onToggleSave: (_) {},
                      onRemove: (_) {},
                      myRecipes: const [],
                      onAddRecipe: (_) {},
                      userProfile: const {},
                      onUpdateProfile: (_) {},
                    ),
                  ),
                );
              },
              child: _bottomNavItem(
                Icons.favorite_border_rounded,
                "Suka",
                false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      savedRecipes: const [],
                      isRecipeSaved: (_) => false,
                      onToggleSave: (_) {},
                      isGuest: false,
                      onLogout: () {},
                      myRecipes: const [],
                      onAddRecipe: (_) {},
                      userProfile: const {},
                      onUpdateProfile: (_) {},
                    ),
                  ),
                );
              },
              child: _bottomNavItem(
                Icons.person_outline_rounded,
                "Profil",
                false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: const Text(
        'Kreasiku',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildNavbar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Navbar Kreasiku',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.amber,
        indicatorWeight: 3,
        tabs: const [
          Tab(text: 'Draft'),
          Tab(text: 'Ditinjau'),
          Tab(text: 'Publish'),
        ],
      ),
    );
  }

  Widget _buildDraftTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resepku',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (draftRecipes.isEmpty)
            _buildEmptyState('Belum ada resep draft')
          else
            ...draftRecipes.map((recipe) => _buildDraftCard(recipe)),
        ],
      ),
    );
  }

  Widget _buildDraftCard(Map<String, dynamic> recipe) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(
                  recipe['image'] ??
                      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.amber[50],
                      child: const Icon(
                        Icons.restaurant,
                        size: 60,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 180,
                      color: Colors.amber[50],
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.amber),
                      ),
                    );
                  },
                ),
                // Title overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      recipe['name'] ?? 'Resep Baru',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Resep',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      recipe['time'] ?? '30 Menit',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.signal_cellular_alt,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      recipe['difficulty'] ?? 'Mudah',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            draftRecipes.remove(recipe);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[400]!),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Hapus',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _uploadRecipe(recipe),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Upload',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInProgressTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resepku',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (inProgressRecipes.isEmpty)
            _buildEmptyState('Tidak ada resep dalam peninjauan')
          else
            ...inProgressRecipes.map((recipe) => _buildInProgressCard(recipe)),
        ],
      ),
    );
  }

  Widget _buildInProgressCard(Map<String, dynamic> recipe) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with overlay
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(
                  recipe['image'] ??
                      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.amber[50],
                      child: const Icon(
                        Icons.restaurant,
                        size: 60,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 180,
                      color: Colors.amber[50],
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.amber),
                      ),
                    );
                  },
                ),
                // Progress overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            recipe['name'] ?? 'Resep Baru',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            recipe['time'] ?? '30 Menit',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              recipe['progress'] ?? 'Sedang ditinjau',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublishedTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber[200]!),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.amber, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Hari ini\nBaru diupload\n10 menit yang lalu',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Resepku',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (publishedRecipes.isEmpty)
            _buildEmptyState('Belum ada resep dipublikasi')
          else
            ...publishedRecipes.map((recipe) => _buildPublishedCard(recipe)),
        ],
      ),
    );
  }

  Widget _buildPublishedCard(Map<String, dynamic> recipe) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              recipe['image'] ??
                  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.amber[50],
                  child: const Icon(
                    Icons.restaurant,
                    size: 60,
                    color: Colors.grey,
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 180,
                  color: Colors.amber[50],
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  ),
                );
              },
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['name'] ?? 'Resep Baru',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      recipe['time'] ?? '30 Menit',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.signal_cellular_alt,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      recipe['difficulty'] ?? 'Mudah',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.amber,
                      child: const Icon(
                        Icons.person,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Pengguna',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    const Spacer(),
                    Icon(Icons.visibility, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      '0',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.thumb_up_outlined,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '0',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Icon(Icons.restaurant_menu, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KreasiResepPage(onRecipeCreated: _addRecipe),
          ),
        );
      },
      backgroundColor: Colors.amber,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.amber,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home, 'Beranda', false),
          _buildNavItem(Icons.receipt_long, 'Menu', false),
          _buildNavItem(Icons.person, 'Profil', true),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? Colors.white : Colors.white70, size: 28),
        const SizedBox(height: 4),
        if (isActive)
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
      ],
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

class KreasiResepPage extends StatefulWidget {
  final Function(Map<String, dynamic>)? onRecipeCreated;
  final VoidCallback? onClose;

  const KreasiResepPage({Key? key, this.onRecipeCreated, this.onClose})
    : super(key: key);

  @override
  State<KreasiResepPage> createState() => _KreasiResepPageState();
}

class _KreasiResepPageState extends State<KreasiResepPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _judulResepController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _porsiController = TextEditingController();
  final TextEditingController _durasiMasakController = TextEditingController();
  final TextEditingController _langkahController = TextEditingController();

  // State variables
  String _selectedCategory = 'Makanan';
  String _selectedDifficulty = 'Mudah';
  List<Map<String, String>> _ingredients = [];
  List<String> _steps = [];
  bool _isPublic = true;

  // Categories
  final List<String> _categories = [
    'Makanan',
    'Minuman',
    'Dessert',
    'Appetizer',
    'Main Course',
  ];

  // Difficulty levels
  final List<String> _difficultyLevels = ['Mudah', 'Sedang', 'Sulit'];

  @override
  void dispose() {
    _judulResepController.dispose();
    _deskripsiController.dispose();
    _porsiController.dispose();
    _durasiMasakController.dispose();
    _langkahController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final quantityController = TextEditingController();

        return AlertDialog(
          title: const Text('Tambah Bahan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Bahan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah (misal: 200g, 2 butir)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    quantityController.text.isNotEmpty) {
                  setState(() {
                    _ingredients.add({
                      'name': nameController.text,
                      'quantity': quantityController.text,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  void _addStep() {
    if (_langkahController.text.isNotEmpty) {
      setState(() {
        _steps.add(_langkahController.text);
        _langkahController.clear();
      });
    }
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      if (_ingredients.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mohon tambahkan minimal 1 bahan'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_steps.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mohon tambahkan minimal 1 langkah'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Create recipe data
      final recipe = {
        'name': _judulResepController.text,
        'description': _deskripsiController.text,
        'category': _selectedCategory,
        'difficulty': _selectedDifficulty,
        'servings': _porsiController.text,
        'time': _durasiMasakController.text,
        'ingredients': _ingredients,
        'steps': _steps,
        'isPublic': _isPublic.toString(),
        'createdAt': DateTime.now().toString(),
      };

      // Callback to parent if provided
      if (widget.onRecipeCreated != null) {
        widget.onRecipeCreated!(recipe);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resep berhasil disimpan!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Resep(s)'),
                      const SizedBox(height: 15),
                      _buildCategoryTabs(),
                      const SizedBox(height: 25),
                      _buildSectionTitle('Tulis Resep'),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: _judulResepController,
                        label: 'Judul Resep',
                        hint: 'Masukkan judul resep Anda',
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: _deskripsiController,
                        label: 'Cerita Resep',
                        hint: 'Ceritakan tentang resep Anda',
                        maxLines: 4,
                      ),
                      const SizedBox(height: 25),
                      _buildSectionTitle('Detail Resep'),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: _porsiController,
                              label: 'Porsi',
                              hint: 'misal: 4 porsi',
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: _buildTextField(
                              controller: _durasiMasakController,
                              label: 'Durasi Masak',
                              hint: 'misal: 30 menit',
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _buildDifficultyDropdown(),
                      const SizedBox(height: 25),
                      _buildSectionTitle('Bahan'),
                      const SizedBox(height: 15),
                      _buildIngredientsList(),
                      const SizedBox(height: 15),
                      _buildAddButton('Tambah Bahan', _addIngredient),
                      const SizedBox(height: 25),
                      _buildSectionTitle('Langkah'),
                      const SizedBox(height: 15),
                      _buildStepsList(),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: _langkahController,
                        label: 'Tambah Langkah',
                        hint: 'Tulis langkah memasak',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 15),
                      _buildAddButton('Tambah Langkah', _addStep),
                      const SizedBox(height: 25),
                      _buildPublicToggle(),
                      const SizedBox(height: 30),
                      _buildSubmitButtons(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (widget.onClose != null) {
                widget.onClose!();
              }
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.close,
                size: 24,
                color: Color(0xFF2D3436),
              ),
            ),
          ),
          const SizedBox(width: 15),
          const Text(
            'Mau bikin resep ?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3436),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3436),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.amber : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.amber : Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[700],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3436),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.amber, width: 2),
            ),
            contentPadding: const EdgeInsets.all(15),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field ini tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDifficultyDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tingkat Kesulitan',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3436),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedDifficulty,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.amber),
              items: _difficultyLevels.map((String difficulty) {
                return DropdownMenuItem<String>(
                  value: difficulty,
                  child: Text(difficulty),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDifficulty = newValue;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsList() {
    if (_ingredients.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            'Belum ada bahan ditambahkan',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _ingredients.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey[200]),
        itemBuilder: (context, index) {
          final ingredient = _ingredients[index];
          return ListTile(
            leading: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
            title: Text(
              ingredient['name']!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(ingredient['quantity']!),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  _ingredients.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildStepsList() {
    if (_steps.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            'Belum ada langkah ditambahkan',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _steps.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey[200]),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(_steps[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  _steps.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add, color: Colors.amber),
        label: Text(text, style: const TextStyle(color: Colors.amber)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          side: const BorderSide(color: Colors.amber),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildPublicToggle() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Publikasikan resep',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Switch(
            value: _isPublic,
            onChanged: (value) {
              setState(() {
                _isPublic = value;
              });
            },
            activeColor: Colors.amber,
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              if (widget.onClose != null) {
                widget.onClose!();
              }
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(18),
              side: BorderSide(color: Colors.grey[400]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Batal',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: _saveRecipe,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Simpan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// KreasiListPage - Shows user's created recipes with add button
class KreasiListPage extends StatefulWidget {
  final List<Map<String, dynamic>> myRecipes;
  final void Function(Map<String, dynamic>) onAddRecipe;
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final Map<String, dynamic> userProfile;
  final void Function(Map<String, dynamic>) onUpdateProfile;

  const KreasiListPage({
    super.key,
    required this.myRecipes,
    required this.onAddRecipe,
    this.savedRecipes = const [],
    required this.isRecipeSaved,
    required this.onToggleSave,
    required this.userProfile,
    required this.onUpdateProfile,
  });

  @override
  State<KreasiListPage> createState() => _KreasiListPageState();
}

class _KreasiListPageState extends State<KreasiListPage> {
  int _selectedIndex = 1;

  void _navigateToCreateRecipe() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KreasiResepPage(
          onRecipeCreated: (recipe) {
            widget.onAddRecipe(recipe);
            setState(() {});
          },
          onClose: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

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
            userProfile: const {},
            onUpdateProfile: (_) {},
          ),
        ),
        (route) => false,
      );
    } else if (index == 2) {
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
            userProfile: const {},
            onUpdateProfile: (_) {},
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
            userProfile: const {},
            onUpdateProfile: (_) {},
          ),
        ),
      );
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: widget.myRecipes.isEmpty
                      ? _buildEmptyState()
                      : _buildRecipesGrid(),
                ),
                const SizedBox(height: 90),
              ],
            ),
          ),
          _buildFloatingBottomBar(),
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              onPressed: _navigateToCreateRecipe,
              backgroundColor: Colors.amber,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          const Text(
            'Kreasi Saya',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.restaurant_menu,
              size: 80,
              color: Colors.amber[200],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Belum ada kreasi resep',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 232, 174, 174),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Buat resep pertamamu dan\nbagi ke komunitas kuliner',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: _navigateToCreateRecipe,
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Buat Resep Pertama',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipesGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.85,
      ),
      itemCount: widget.myRecipes.length,
      itemBuilder: (context, index) {
        final recipe = widget.myRecipes[index];
        return _buildRecipeCard(recipe);
      },
    );
  }

  Widget _buildRecipeCard(Map<String, dynamic> recipe) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe Image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Stack(
                  children: [
                    // Check if recipe has image
                    if (recipe['imageUrl'] != null)
                      Image.network(
                        recipe['imageUrl'] as String,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.restaurant,
                              size: 50,
                              color: Colors.amber[300],
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        },
                      )
                    else
                      Center(
                        child: Icon(
                          Icons.restaurant,
                          size: 50,
                          color: Colors.amber[300],
                        ),
                      ),
                    // Category badge
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          recipe['category'] ?? 'Makanan',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Recipe Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['name'] ?? 'Resep Baru',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      recipe['time'] ?? '30 Menit',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.signal_cellular_alt,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      recipe['difficulty'] ?? 'Mudah',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
