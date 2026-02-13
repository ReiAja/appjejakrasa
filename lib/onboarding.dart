import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';
import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final List<Map<String, dynamic>> myRecipes;
  final void Function(Map<String, dynamic>) onAddRecipe;
  final Map<String, dynamic> userProfile;
  final void Function(Map<String, dynamic>) onUpdateProfile;

  const OnboardingPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.myRecipes = const [],
    required this.onAddRecipe,
    required this.userProfile,
    required this.onUpdateProfile,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentPage = 0;

  late AnimationController _animationController;
  late Timer _autoScrollTimer;

  static const Duration _autoScrollDuration = Duration(seconds: 4);
  static const Duration _animationDuration = Duration(milliseconds: 4000);

  static const Color primaryColor = Color(0xFFFBC02D); 
  static const Color primaryLight = Color.fromARGB(255, 244, 231, 110);
  static const Color primaryDark = Color(0xFFF9A825);
  static const Color gradientStart = Color(0xFFFFFDE7); 
  static const Color gradientEnd = Color(0xFFFFF9C4); 

  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Jejak Rasa Nusantara",
      "subtitle": "Kuliner Tradisional Indonesia",
      "description": "Jelajahi kekayaan cita rasa dari Sabang sampai Merauke",
      "image": "https://www.flokq.com/blog/wp-content/uploads/2022/02/Makanan-Khas-Nusantara.jpg",
    },
    {
      "title": "Resep Warisan",
      "subtitle": "Turun Temurun",
      "description": "Resep autentik yang diwariskan generasi demi generasi",
      "image": "https://www.unileverfoodsolutions.co.id/id/inspirasi-chef/makanan-tradisional-indonesia/jcr:content/parsys/set1/row2/span12/textimage_1360031984_1176110059/image.transform/jpeg-optimized/image.1739274459638.jpg",
    },
    {
      "title": "Masak Bersama",
      "subtitle": "Nusantara Berdiferensiasi",
      "description": "Pengalaman memasak yang tak terlupakan",
      "image": "https://www.balipost.com/wp-content/uploads/2019/03/balipostcom_nyakan-diwang-di-desa-kayuputih-merajut-kekeluargaan_01.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _animationController.forward();
    _autoScrollTimer = Timer.periodic(_autoScrollDuration, (timer) {
      if (_currentPage < onboardingData.length - 1) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      } else {
        _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [gradientStart, gradientEnd.withOpacity(0.5), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: _onPageChanged,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return _buildSlide(index);
                  },
                ),
              ),
              _buildAnimatedBarSlice(),
              _buildTextContent(),
              const SizedBox(height: 30),
              _buildButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _controller.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                },
                child: Container(
                  // Dekorasi kotak dan bayangan telah dihapus di sini
                  child: Image.asset(
                    'assets/logoweb.png',
                    width: 55,
                    height: 55,
                  ),
                ),
              ),
              const SizedBox(width: 3),
              const Text(
                "Jejak Rasa",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: primaryDark,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    savedRecipes: widget.savedRecipes,
                    isRecipeSaved: widget.isRecipeSaved,
                    onToggleSave: widget.onToggleSave,
                    isGuest: true,
                    myRecipes: widget.myRecipes,
                    onAddRecipe: widget.onAddRecipe,
                    userProfile: widget.userProfile,
                    onUpdateProfile: widget.onUpdateProfile,
                  ),
                ),
              );
            },
            child: const Text(
              "Lewati",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double pageValue = 0.0;
        if (_controller.position.haveDimensions) {
          pageValue = _controller.page!;
        }
        double scale = (pageValue - index).abs();
        double transformValue = 1 - (scale * 0.1).clamp(0.0, 0.1);

        return Transform.scale(
          scale: transformValue,
          child: Opacity(
            opacity: 1 - (scale * 0.3).clamp(0.0, 0.3),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        onboardingData[index]['image'] as String,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.amber[50],
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.amber[200],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.auto_awesome,
                              size: 14,
                              color: primaryColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${index + 1}/${onboardingData.length}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedBarSlice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomPaint(
            painter: ElegantBarSlicePainter(
              currentPage: _currentPage,
              totalPages: onboardingData.length,
              progress: _animationController.value,
              accentColor: primaryColor,
            ),
            size: const Size(double.infinity, 6),
          );
        },
      ),
    );
  }

  Widget _buildTextContent() {
    final data = onboardingData[_currentPage];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 4,
                height: 24,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Text(
                  data['title'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D2D2D),
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            data['subtitle'] as String,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: primaryDark.withOpacity(0.9),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              data['description'] as String,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      savedRecipes: widget.savedRecipes,
                      isRecipeSaved: widget.isRecipeSaved,
                      onToggleSave: widget.onToggleSave,
                      myRecipes: widget.myRecipes,
                      onAddRecipe: widget.onAddRecipe,
                      userProfile: widget.userProfile,
                      onUpdateProfile: widget.onUpdateProfile,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 4,
                shadowColor: primaryColor.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mulai Eksplorasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    savedRecipes: widget.savedRecipes,
                    isRecipeSaved: widget.isRecipeSaved,
                    onToggleSave: widget.onToggleSave,
                    isGuest: true,
                    myRecipes: widget.myRecipes,
                    onAddRecipe: widget.onAddRecipe,
                    userProfile: widget.userProfile,
                    onUpdateProfile: widget.onUpdateProfile,
                  ),
                ),
              );
            },
            child: Text(
              "Login Tanpa Akun",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ElegantBarSlicePainter extends CustomPainter {
  final int currentPage;
  final int totalPages;
  final double progress;
  final Color accentColor;

  ElegantBarSlicePainter({
    required this.currentPage,
    required this.totalPages,
    required this.progress,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double barWidth = size.width / totalPages;
    final double height = size.height;

    final containerPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.fill;

    final containerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, height),
      Radius.circular(height / 2),
    );
    canvas.drawRRect(containerRect, containerPaint);

    for (int i = 0; i < totalPages; i++) {
      final inactivePaint = Paint()
        ..color = Colors.amber[50]!
        ..style = PaintingStyle.fill;

      final double xOffset = i * barWidth;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(xOffset + 2, 2, barWidth - 4, height - 4),
        Radius.circular((height - 4) / 2),
      );
      canvas.drawRRect(rect, inactivePaint);
    }

    final activePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    final double activeBarWidth = (barWidth - 4) * progress;
    final double xOffset = currentPage * barWidth + 2;

    final activeRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(xOffset, 2, activeBarWidth, height - 4),
      Radius.circular((height - 4) / 2),
    );
    canvas.drawRRect(activeRect, activePaint);
  }

  @override
  bool shouldRepaint(covariant ElegantBarSlicePainter oldDelegate) => true;
}