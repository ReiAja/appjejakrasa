import 'package:flutter/material.dart';

class BantuanPage extends StatefulWidget {
  const BantuanPage({Key? key}) : super(key: key);

  @override
  State<BantuanPage> createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: 'Bagaimana cara membuat resep baru?',
      answer:
          'Untuk membuat resep baru, pergi ke halaman Profil dan klik tombol "Buat Resep". Isi nama resep, deskripsi, bahan-bahan, langkah-langkah, dan foto resep Anda.',
    ),
    FAQItem(
      question: 'Bagaimana cara menyimpan resep favorit?',
      answer:
          'Pada halaman detail resep, klik ikon bookmark (simpan) di pojok kanan atas. Resep akan tersimpan di halaman "Disimpan" pada profil Anda.',
    ),
    FAQItem(
      question: 'Apakah saya bisa mengedit profil saya?',
      answer:
          'Ya, klik ikon edit pada halaman Profil, lalu pilih "Edit Profil". Anda dapat mengubah foto, nama, bio, lokasi, dan tautan sosial media.',
    ),
    FAQItem(
      question: 'Bagaimana cara menghapus resep yang sudah dibuat?',
      answer:
          'Pergi ke tab "Resep Saya" di profil Anda. Geser kartu resep ke kiri hingga muncul ikon hapus, lalu konfirmasi penghapusan.',
    ),
    FAQItem(
      question: 'Apakah data saya aman?',
      answer:
          'Kami berkomitmen menjaga keamanan data Anda. Anda dapat mengatur privasi akun di menu Pengaturan > Privasi.',
    ),
    FAQItem(
      question: 'Bagaimana cara melaporkan resep yang melanggar?',
      answer:
          'Pada halaman detail resep, klik ikon titik tiga di pojok kanan atas dan pilih "Laporkan". Tim kami akan menindaklanjuti dalam 24 jam.',
    ),
    FAQItem(
      question: 'Apakah aplikasi ini gratis?',
      answer:
          'Ya, Kuliner Nusantara sepenuhnya gratis untuk digunakan. Kami tidak mengenakan biaya untuk fitur-fitur utama.',
    ),
    FAQItem(
      question: 'Bagaimana cara mengganti bahasa?',
      answer:
          'Pengaturan bahasa dapat ditemukan di menu Pengaturan > Preferensi > Bahasa. Saat ini tersedia Bahasa Indonesia dan English.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Bantuan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black87,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
            tabs: [
              Tab(text: 'FAQ'),
              Tab(text: 'Kontak'),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildFAQSection(), _buildContactSection()],
        ),
      ),
    );
  }

  Widget _buildFAQSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search FAQ
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
              decoration: InputDecoration(
                hintText: 'Cari bantuan...',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontFamily: 'Poppins',
                  fontSize: 13,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.amber[600]),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // FAQ List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _faqs.length,
            itemBuilder: (context, index) {
              return _buildFAQCard(_faqs[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFAQCard(FAQItem faq) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(bottom: 12),
      iconColor: Colors.amber[700],
      collapsedIconColor: Colors.amber[700],
      title: Text(
        faq.question,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          color: Colors.black87,
        ),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            faq.answer,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
              fontFamily: 'Poppins',
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contact Info
          const Text(
            'Ada pertanyaan atau masalah?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tim kami siap membantu Anda 24/7',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[500],
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 24),

          // Contact Options
          _buildContactCard(
            icon: Icons.email_outlined,
            title: 'Email',
            subtitle: 'support@kulinernusantara.com',
            color: Colors.amber,
            onTap: () {
              _showSnackBar('Email: support@kulinernusantara.com');
            },
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.phone_outlined,
            title: 'Telepon',
            subtitle: '+62 21 1234 5678',
            color: Colors.green,
            onTap: () {
              _showSnackBar('Telepon: +62 21 1234 5678');
            },
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.chat_bubble_outline,
            title: 'Live Chat',
            subtitle: 'Responder dalam 5 menit',
            color: Colors.blue,
            onTap: () {
              _showSnackBar('Fitur live chat sedang dalam pengembangan');
            },
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.camera_alt,
            title: 'Instagram',
            subtitle: '@kulinernusantara',
            color: Colors.pink,
            onTap: () {
              _showSnackBar('Instagram: @kulinernusantara');
            },
          ),

          const SizedBox(height: 32),

          // Rate App Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber[400]!, Colors.amber[700]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(Icons.star_outline, color: Colors.white, size: 40),
                const SizedBox(height: 12),
                const Text(
                  'Nilai Aplikasi Kami',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bantu kami menjadi lebih baik dengan memberikan rating',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.9),
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Icon(Icons.star, color: Colors.white, size: 32),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showSnackBar('Terima kasih atas rating Anda!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.amber[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Berikan Rating',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // App Info
          Center(
            child: Column(
              children: [
                Text(
                  'Kuliner Nusantara v1.0.0',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '© 2024 Kuliner Nusantara',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[300],
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.amber[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
