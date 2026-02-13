import 'package:flutter/material.dart';
import 'detail_makanan.dart';
import 'onboarding.dart';
import 'kreasi.dart';
import 'edit_profile_page.dart';
import 'notifikasi.dart';
import 'privasi_page.dart';
import 'bantuan_page.dart';

class ProfilePage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;
  final VoidCallback onLogout;
  final List<Map<String, dynamic>> myRecipes;
  final void Function(Map<String, dynamic>) onAddRecipe;
  final Map<String, dynamic> userProfile;
  final void Function(Map<String, dynamic>) onUpdateProfile;

  const ProfilePage({
    Key? key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
    required this.onLogout,
    required this.myRecipes,
    required this.onAddRecipe,
    required this.userProfile,
    required this.onUpdateProfile,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTab = 0;

  final List<Map<String, dynamic>> _sampleRecipes = [
    {
      'name': 'Nasi Goreng Spesial',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3MXxuKOYYevJUUN5dCFs8LY78Xl7T4ZDNXA&s',
      'time': '25 Menit',
      'difficulty': 'Mudah',
      'portion': '2 Porsi',
      'likes': 128,
    },
    {
      'name': 'Sate Ayam Madura',
      'imageUrl':
          'https://asset.kompas.com/crops/zekDoITPKTJmLawnP6e3a5E4t50=/3x0:700x465/1200x800/data/photo/2024/07/08/668b52974ead4.jpg',
      'time': '45 Menit',
      'difficulty': 'Menengah',
      'portion': '4 Porsi',
      'likes': 256,
    },
    {
      'name': 'Rendang Daging Sapi',
      'imageUrl':
          'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/07/31040437/ini-resep-bumbu-rendang-daging-sapi-untuk-acara-spesial.jpg',
      'time': '2 Jam',
      'difficulty': 'Sulit',
      'portion': '6 Porsi',
      'likes': 512,
    },
    {
      'name': 'Gado-Gado Siram',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTapkVFRzj22RLxJlgYo4ZY6vKeAfPxfoAAxQ&s',
      'time': '20 Menit',
      'difficulty': 'Mudah',
      'portion': '3 Porsi',
      'likes': 89,
    },
    {
      'name': 'Ayam Betutu Bali',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS758vrF5A_4wXwpfzjAtWAGInvQf1BpSCdRA&s',
      'time': '1.5 Jam',
      'difficulty': 'Menengah',
      'portion': '4 Porsi',
      'likes': 178,
    },
    {
      'name': 'Es Cendol Durian',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3abOkmQW8xKCZyXnUxH-cUiN803nOVuJhpQ&s',
      'time': '15 Menit',
      'difficulty': 'Mudah',
      'portion': '2 Gelas',
      'likes': 342,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {
        selectedTab = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Keluar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal', style: TextStyle(color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onLogout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => OnboardingPage(
                    savedRecipes: [],
                    isRecipeSaved: (_) => false,
                    onToggleSave: (_) {},
                    myRecipes: [],
                    onAddRecipe: (_) {},
                    userProfile: const {},
                    onUpdateProfile: (_) {},
                  ),
                ),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Keluar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showSettings() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pengaturan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 24),
            _buildSettingsItem(Icons.person_outline, 'Edit Profil', () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    name: widget.userProfile['name'] ?? '',
                    bio: widget.userProfile['bio'] ?? '',
                    location: widget.userProfile['location'] ?? '',
                    instagram: widget.userProfile['instagram'] ?? '',
                    youtube: widget.userProfile['youtube'] ?? '',
                    website: widget.userProfile['website'] ?? '',
                    onSave: (profileData) {
                      widget.onUpdateProfile(profileData);
                    },
                  ),
                ),
              );
            }),
            _buildSettingsItem(Icons.notifications_outlined, 'Notifikasi', () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotifikasiPage()),
              );
            }),
            _buildSettingsItem(Icons.privacy_tip_outlined, 'Privasi', () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivasiPage()),
              );
            }),
            _buildSettingsItem(Icons.help_outline, 'Bantuan', () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BantuanPage()),
              );
            }),
            const Divider(height: 32),
            _buildSettingsItem(Icons.logout, 'Keluar', () {
              Navigator.pop(context);
              _handleLogout();
            }, color: Colors.amber[700]!),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color color = Colors.black87,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color == Colors.amber[700]
              ? Colors.amber[50]
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: color == Colors.amber[700]
              ? Colors.amber[700]
              : Colors.grey[700],
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.black87,
                  ),
                  onPressed: _showSettings,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.amber[400]!, Colors.amber[700]!],
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            !widget.isGuest &&
                                widget.userProfile['profileImage'] != null &&
                                widget.userProfile['profileImage']
                                    .toString()
                                    .isNotEmpty
                            ? NetworkImage(widget.userProfile['profileImage'])
                            : null,
                        child:
                            widget.isGuest ||
                                widget.userProfile['profileImage'] == null ||
                                widget.userProfile['profileImage']
                                    .toString()
                                    .isEmpty
                            ? Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.grey[400],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.isGuest
                          ? 'User'
                          : (widget.userProfile['name'] ?? 'JAYAA PRATAMA'),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    if (!widget.isGuest &&
                        widget.userProfile['bio'] != null &&
                        widget.userProfile['bio'].toString().isNotEmpty) ...[
                      Text(
                        widget.userProfile['bio'],
                        style: TextStyle(
                          color: Colors.amber[700],
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (!widget.isGuest &&
                        widget.userProfile['location'] != null &&
                        widget.userProfile['location']
                            .toString()
                            .isNotEmpty) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          Text(
                            ' ${widget.userProfile['location']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 20),
                    // Stats
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem(
                            widget.myRecipes.length.toString(),
                            'Resep',
                            Icons.restaurant_menu,
                          ),
                          _buildStatItem(
                            widget.isGuest ? '0' : '1.2K',
                            'Pengikut',
                            Icons.people_outline,
                          ),
                          _buildStatItem(
                            widget.isGuest ? '0' : '89',
                            'Mengikuti',
                            Icons.favorite_border,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.amber[700],
                  unselectedLabelColor: Colors.grey[500],
                  indicatorColor: Colors.amber[700],
                  tabs: const [
                    Tab(text: 'Resep Saya'),
                    Tab(text: 'Disimpan'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [_buildMyRecipesContent(), _buildSavedRecipesContent()],
        ),
      ),
      floatingActionButton: selectedTab == 0
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KreasiResepPage(
                    onRecipeCreated: (recipe) => widget.onAddRecipe(recipe),
                    onClose: () => Navigator.pop(context),
                  ),
                ),
              ),
              backgroundColor: Colors.amber[700],
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'Buat Resep',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 18, color: Colors.amber[600]),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
      ],
    );
  }

  Widget _buildMyRecipesContent() {
    return widget.myRecipes.isEmpty
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _buildEmptyState(),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(16).copyWith(bottom: 80),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: widget.myRecipes.length,
            itemBuilder: (context, index) => _buildPremiumRecipeCard(
              widget.myRecipes[index],
              isSample: false,
            ),
          );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(Icons.restaurant_menu, size: 50, color: Colors.amber[300]),
              const SizedBox(height: 12),
              const Text(
                'Belum ada resep',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Bagikan resep pertamamu ke komunitas!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 115, 114, 114),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Resep Inspirasi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemCount: _sampleRecipes.length,
          itemBuilder: (context, index) =>
              _buildPremiumRecipeCard(_sampleRecipes[index], isSample: true),
        ),
      ],
    );
  }

  Widget _buildPremiumRecipeCard(
    Map<String, dynamic> recipe, {
    required bool isSample,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailResepLengkap(
            namaResep: recipe['name'],
            imageUrl: recipe['imageUrl'],
            isRecipeSaved: widget.isRecipeSaved,
            onToggleSave: widget.onToggleSave,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  recipe['imageUrl'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${recipe['time']} • ${recipe['difficulty']}',
                    style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedRecipesContent() {
    if (widget.savedRecipes.isEmpty) {
      return const Center(child: Text('Belum ada resep disimpan'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16).copyWith(bottom: 80),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.savedRecipes.length,
      itemBuilder: (context, index) {
        final recipe = widget.savedRecipes[index];
        return _buildPremiumRecipeCard({
          'name': recipe['name'],
          'imageUrl': recipe['img'],
          'time': '30 Menit',
          'difficulty': 'Mudah',
        }, isSample: false);
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
