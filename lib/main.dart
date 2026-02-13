import 'package:flutter/material.dart';
import 'loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Global list untuk menyimpan resep yang disukai
  final List<Map<String, String>> _savedRecipes = [];

  // Global list untuk menyimpan resep yang dibuat pengguna
  final List<Map<String, dynamic>> _myRecipes = [];

  // User profile data
  Map<String, dynamic> _userProfile = {
    'name': 'Jejak Rasa',
    'bio':
        'Chef Rumahan yang passionate dalam memasak masakan Indonesia tradisional. Mencoba resep baru setiap minggu!',
    'location': 'Kota Malang, Jawa Timur, Indonesia',
    'instagram': '',
    'youtube': '',
    'website': '',
    'profileImage':
        'https://static.promediateknologi.id/crop/0x0:0x0/1200x800/webp/photo/p1/273/2024/07/28/Ilustrasi-5-karakter-anime-Naruto-yang-mempunyai-kisah-hidup-paling-memilukan-dan-kelam-3100482745.jpg',
  };

  void _toggleSaveRecipe(Map<String, String> recipe) {
    setState(() {
      final index = _savedRecipes.indexWhere(
        (r) => r['name'] == recipe['name'],
      );
      if (index >= 0) {
        _savedRecipes.removeAt(index);
      } else {
        _savedRecipes.add(recipe);
      }
    });
  }

  bool _isRecipeSaved(String name) {
    return _savedRecipes.any((r) => r['name'] == name);
  }

  void _addUserRecipe(Map<String, dynamic> recipe) {
    setState(() {
      _myRecipes.add(recipe);
    });
  }

  void _updateUserProfile(Map<String, dynamic> newProfile) {
    setState(() {
      _userProfile = {..._userProfile, ...newProfile};
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jejak Rasa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Poppins'),
      home: LoadingPage(
        savedRecipes: _savedRecipes,
        isRecipeSaved: _isRecipeSaved,
        onToggleSave: _toggleSaveRecipe,
        myRecipes: _myRecipes,
        onAddRecipe: _addUserRecipe,
        userProfile: _userProfile,
        onUpdateProfile: _updateUserProfile,
      ),
    );
  }
}
