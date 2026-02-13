import 'package:flutter/material.dart';
import 'onboarding.dart';

class LoadingPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final List<Map<String, dynamic>> myRecipes;
  final void Function(Map<String, dynamic>) onAddRecipe;
  final Map<String, dynamic> userProfile;
  final void Function(Map<String, dynamic>) onUpdateProfile;

  const LoadingPage({
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
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _textFadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 50,
      ),
    ]).animate(_controller);

    _textFadeIn = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingPage(
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
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: _textFadeIn,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  // Menghapus dekorasi lingkaran dan bayangan
                  child: Image.asset(
                    'assets/logoweb.png',
                    width: 140, // Menyesuaikan dengan radius 70 sebelumnya
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}