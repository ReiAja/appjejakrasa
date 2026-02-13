import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String bio;
  final String location;
  final String instagram;
  final String youtube;
  final String website;
  final Function(Map<String, String>)? onSave;

  const EditProfilePage({
    Key? key,
    this.name = 'Sania Wijaya',
    this.bio =
        'Chef Rumahan yang passionate dalam memasak masakan Indonesia tradisional. Mencoba resep baru setiap minggu!',
    this.location = 'Jakarta, Indonesia',
    this.instagram = '',
    this.youtube = '',
    this.website = '',
    this.onSave,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _locationController;
  late TextEditingController _instagramController;
  late TextEditingController _youtubeController;
  late TextEditingController _websiteController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _bioController = TextEditingController(text: widget.bio);
    _locationController = TextEditingController(text: widget.location);
    _instagramController = TextEditingController(text: widget.instagram);
    _youtubeController = TextEditingController(text: widget.youtube);
    _websiteController = TextEditingController(text: widget.website);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _instagramController.dispose();
    _youtubeController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    setState(() {
      _isLoading = true;
    });

    // Simulate saving
    Future.delayed(const Duration(milliseconds: 800), () {
      final profileData = {
        'name': _nameController.text,
        'bio': _bioController.text,
        'location': _locationController.text,
        'instagram': _instagramController.text,
        'youtube': _youtubeController.text,
        'website': _websiteController.text,
      };

      if (widget.onSave != null) {
        widget.onSave!(profileData);
      }

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Profil berhasil diperbarui',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          backgroundColor: Colors.amber[700],
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveProfile,
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.amber,
                    ),
                  )
                : Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.amber[400]!, Colors.amber[700]!],
                      ),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.amber[700],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 18,
                      color: Colors.amber[700],
                    ),
                    label: Text(
                      'Ubah Foto',
                      style: TextStyle(
                        color: Colors.amber[700],
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Basic Info Section
            _buildSectionTitle('Informasi Dasar'),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _nameController,
              label: 'Nama',
              hint: 'Masukkan nama Anda',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _bioController,
              label: 'Bio',
              hint: 'Ceritakan tentang Anda',
              icon: Icons.info_outline,
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _locationController,
              label: 'Lokasi',
              hint: 'Masukkan lokasi Anda',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 30),

            // Social Media Section
            _buildSectionTitle('Sosial Media'),
            const SizedBox(height: 16),

            _buildSocialField(
              controller: _instagramController,
              label: 'Instagram',
              hint: '@username',
              icon: Icons.camera_alt,
              color: Colors.pink,
            ),
            const SizedBox(height: 16),

            _buildSocialField(
              controller: _youtubeController,
              label: 'YouTube',
              hint: 'Nama channel YouTube',
              icon: Icons.play_circle_outline,
              color: Colors.red,
            ),
            const SizedBox(height: 16),

            _buildSocialField(
              controller: _websiteController,
              label: 'Website',
              hint: 'https://',
              icon: Icons.language,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Simpan Perubahan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: Colors.grey[800],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: TextStyle(fontFamily: 'Poppins', color: Colors.black87),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'Poppins',
              ),
              prefixIcon: Icon(icon, color: Colors.amber[600], size: 20),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(fontFamily: 'Poppins', color: Colors.black87),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'Poppins',
              ),
              prefixIcon: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                  ),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
