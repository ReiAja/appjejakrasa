import 'package:flutter/material.dart';

class DetailResepLengkap extends StatefulWidget {
  final String namaResep;
  final String imageUrl;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;

  const DetailResepLengkap({
    super.key,
    required this.namaResep,
    required this.imageUrl,
    required this.isRecipeSaved,
    required this.onToggleSave,
  });

  @override
  State<DetailResepLengkap> createState() => _DetailResepLengkapState();
}

// ==========================================
// DATA RESEP LENGKAP - GADO-GADO & RAWON
// ==========================================

Map<String, dynamic> getResepData(String namaResep) {
  if (namaResep.toLowerCase().contains('gado') ||
      namaResep.toLowerCase().contains('gado-gado')) {
    return {
      'durasi': '30 Menit',
      'kalori': '380 kkal',
      'rating': '4.9 (250 ulasan)',
      'bahan': [
        '200g Tahu goreng potong segitiga',
        '150g Tempe bacem potong dadu',
        '100g Kangkung rebus',
        '100g Buncis rebus',
        '2 buah Kentang kupas rebus',
        '1/2 buah Kol putih iris tipis',
        '2 buah Timun iris tipis',
        '100g Taoge rebus',
        '3 siung Bawang putih',
        '5 buah Cabai merah',
        '3 buah Cabai rawit (sesuai selera)',
        '100g Kacang tanah goreng',
        '2 sdt Asam jawa larutkan',
        '3 sdm Gula merah serut',
        '1/2 sdt Terasi bakar',
        'Secukupnya Garam',
        '200ml Air hangat',
        '2 sdm Bawang merah goreng',
        '2 sdm Kerupuk udang',
      ],
      'langkah': [
        {
          'step': '1',
          'durasi': '10 mnt',
          'instruksi':
              'Siapkan semua bahan sayuran. Cuci bersih kangkung, buncis, kol, taoge, dan timun. Rebus kangkung dan buncis dalam air mendidih selama 2-3 menit hingga matang tapi masih renyah, angkat dan tiriskan. Rendam taoge dalam air hangat sebentar.',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjGiAFeiTAAcsfc19bGNbfHJkg6SK07QP8_Q&s',
        },
        {
          'step': '2',
          'durasi': '5 mnt',
          'instruksi':
              'Siapkan bahan protein. Goreng tahu hingga kecokelatan di kedua sisi. Potong tempe bacem sesuai selera. Kupas kentang dan rebus hingga empuk, potong dadu atau wedgor.',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE6Af97FuZpNUkeixpVWU_F4HkBM9fggP_iQ&s',
        },
        {
          'step': '3',
          'durasi': '10 mnt',
          'instruksi':
              'Buat sambal kacang: Haluskan bawang putih, cabai merah, cabai rawit, terasi, dan kacang tanah menggunakan cobek atau blender. Tambahkan gula merah, asam jawa, dan garam. Tuang air hangat sedikit demi sedikit sambil diaduk hingga kekentalan yang diinginkan.',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgCNRbF8pQugDL2jGvJXdF9AADhnxgT0gOMA&s',
        },
        {
          'step': '4',
          'durasi': '3 mnt',
          'instruksi':
              'Koreksi rasa sambal kacang. Seharusnya memiliki rasa manis, asam, pedas yang seimbang. Tambahkan gula atau garam jika perlu. Sisihkan.',
          'image':
              'https://asset.kompas.com/crops/quGIMfLxr-XF5UalTJKuSvdHX90=/5x0:4320x2877/375x240/data/photo/2020/03/27/5e7d6704d1053.jpg',
        },
        {
          'step': '5',
          'durasi': '2 mnt',
          'instruksi':
              'Tata semua bahan di dalam piring saji. Mulai dengan kol di dasar piring, lalu tambahkan kangkung, buncis, kentang, tahu, tempe, taoge, dan timun secara bertingkat.',
          'image':
              'https://cdn0-production-images-kly.akamaized.net/Z1Mmf8jSlTz-R0m9aC2AHWwR1XE=/469x260/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2586834/original/083531100_1546675008-resep-gado-gado-saus-kacang-lezat-dan-sehat.jpg',
        },
        {
          'step': '6',
          'durasi': '1 mnt',
          'instruksi':
              'Siram sambal kacang di atas sayuran. Taburi bawang goreng dan sajikan dengan kerupuk udang. Gado-gado siap dinikmati!',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP2tNm6dRioTyaSzYnTJC6BxxfNvLGCoyJow&s',
        },
      ],
    };
  } else if (namaResep.toLowerCase().contains('rawon')) {
    return {
      'durasi': '90 Menit',
      'kalori': '420 kkal',
      'rating': '4.8 (180 ulasan)',
      'bahan': [
        '500g Daging sapi has dalam potong dadu 3cm',
        '2 liter Air untuk rebusan',
        '100g Kluwek (rendam air hangat)',
        '8 siung Bawang merah',
        '5 siung Bawang putih',
        '5 buah Cabai merah besar',
        '3 buah Cabai rawit',
        '4 butir Kemiri sangrai',
        '2 cm Jahe',
        '3 cm Lengkuas geprek',
        '2 batang Serai geprek',
        '3 lembar Daun salam',
        '3 lembar Daun jeruk',
        '2 sdt Garam',
        '1 sdt Gula pasir',
        '1/2 sdt Merica bubuk',
        'Secukupnya Penyedap rasa',
        '100g Taoge pendek',
        '2 batang Daun bawang iris',
        '3 sdm Bawang goreng',
        '1 buah Jeruk nipis',
      ],
      'langkah': [
        {
          'step': '1',
          'durasi': '15 mnt',
          'instruksi':
              'Persiapan bahan: Cuci bersih daging sapi, potong dadu ukuran 3cm. Rendam kluwek dalam air hangat selama 10 menit, lalu ambil isinya dan haluskan. Iris tipis bawang merah, bawang putih, dan cabai.',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwdaJm_n0C81HUjm6QPjXV80rjRFvfZktfcg&s',
        },
        {
          'step': '2',
          'durasi': '10 mnt',
          'instruksi':
              'Blender atau haluskan bumbu: Bawang merah, bawang putih, cabai merah, cabai rawit, kemiri, jahe, dan kluwek halus. Gunakan sedikit air untuk memudahkan penghalusan.',
          'image':
              'https://images.tokopedia.net/img/KRMmCm/2024/8/13/f6436a8e-e025-46b6-99b9-cba66d8c10a1.jpg',
        },
        {
          'step': '3',
          'durasi': '5 mnt',
          'instruksi':
              'Panaskan 3 sdm minyak goreng dalam wajan besar dengan api sedang. Tumis bumbu halus selama 3-4 menit hingga harum dan warna berubah gelap kehitaman khas rawon.',
          'image':
              'https://i0.wp.com/ptbamboe.com/wp-content/uploads/Pic-77.jpg?resize=1020%2C574&ssl=1',
        },
        {
          'step': '4',
          'durasi': '5 mnt',
          'instruksi':
              'Masukkan serai, lengkuas geprek, daun salam, dan daun jeruk ke dalam tumisan. Aduk rata selama 1 menit hingga aroma keluar.',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWQF-Z1f9tITzsOQwUg0x0QWPbSx1Uh789LQ&s',
        },
        {
          'step': '5',
          'durasi': '60 mnt',
          'instruksi':
              'Masukkan daging sapi ke dalam tumisan, aduk hingga daging berubah warna. Tuang 2 liter air rebusan daging (atau air biasa). Tambahkan garam, gula, merica, dan penyedap rasa. Masak dengan api kecil hingga daging empuk (45-60 menit), sesekali diaduk.',
          'image':
              'https://img-global.cpcdn.com/recipes/bb19a91ec52884e1/680x781cq80/rawon-daging-khas-jawa-timur-foto-resep-utama.jpg',
        },
        {
          'step': '6',
          'durasi': '5 mnt',
          'instruksi':
              'Test keempukan daging. Jika sudah empuk, koreksi rasa rawon. Matikan api. Sajikan dalam mangkuk dengan taburan taoge, irisan daun bawang, bawang goreng, dan perasan jeruk nipis.',
          'image':
              'https://farm3.staticflickr.com/2237/13162229045_03c9dd0f0a.jpg',
        },
        {
          'step': '7',
          'durasi': '2 mnt',
          'instruksi':
              'Rawon biasanya disajikan dengan nasi putih hangat, sambal, dan telur asin. Selamat menikmati rawon khas Jawa Timur yang lezat!',
          'image':
              'https://www.holycowsteak.com/cdn/shop/articles/Thumbnail_bccc9157-1b79-47ed-9300-391dede1d189.webp?v=1748245794',
        },
      ],
    };
  } else {
    // Default data untuk makanan lain
    return {
      'durasi': '45 Menit',
      'kalori': '320 kkal',
      'rating': '4.8 (120 ulasan)',
      'bahan': [
        '500g Bahan Utama',
        '3 siung Bawang Putih',
        '5 buah Cabai Merah',
        'Secukupnya Garam & Gula',
        'Secukupnya Bumbu penyedap',
      ],
      'langkah': [
        {
          'step': '1',
          'durasi': '5 mnt',
          'instruksi':
              'Siapkan semua bahan yang diperlukan. Pastikan bumbu halus sudah dihaluskan sempurna dan bahan utama telah dicuci bersih.',
          'image':
              'https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=400',
        },
        {
          'step': '2',
          'durasi': '10 mnt',
          'instruksi':
              'Panaskan sedikit minyak di wajan dengan api sedang. Tumis bumbu halus hingga mengeluarkan aroma harum dan warnanya sedikit berubah kecokelatan.',
          'image':
              'https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=400',
        },
        {
          'step': '3',
          'durasi': '15 mnt',
          'instruksi':
              'Masukkan bahan utama (seperti protein atau sayuran keras) ke dalam wajan. Aduk rata hingga bumbu meresap dan bahan berubah warna secara merata.',
          'image':
              'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=400',
        },
        {
          'step': '4',
          'durasi': '10 mnt',
          'instruksi':
              'Tambahkan air secukupnya sesuai selera atau petunjuk resep. Biarkan mendidih sambil sesekali diaduk agar bagian bawah tidak gosong.',
          'image':
              'https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=400',
        },
        {
          'step': '5',
          'durasi': '5 mnt',
          'instruksi':
              'Tambahkan garam, gula, dan penyedap rasa. Lakukan koreksi rasa dengan mencicipi sedikit masakan untuk memastikan keseimbangan bumbunya.',
          'image':
              'https://images.unsplash.com/photo-1532336411638-b199ee97f0fb?q=80&w=400',
        },
        {
          'step': '6',
          'durasi': '2 mnt',
          'instruksi':
              'Matikan api dan sajikan masakan selagi hangat. Tambahkan garnish seperti bawang goreng atau irisan cabai untuk mempercantik tampilan.',
          'image':
              'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=400',
        },
      ],
    };
  }
}

class _DetailResepLengkapState extends State<DetailResepLengkap> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    bool isSaved = widget.isRecipeSaved(widget.namaResep);

    // Get data resep based on namaResep
    final resepData = getResepData(widget.namaResep);
    final List<String> bahanList = List<String>.from(resepData['bahan']);
    final List<Map<String, String>> langkahList =
        List<Map<String, String>>.from(resepData['langkah']);
    final String durasi = resepData['durasi'];
    final String kalori = resepData['kalori'];
    final String rating = resepData['rating'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Header dengan Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(widget.imageUrl, fit: BoxFit.cover),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved ? Colors.amber[700] : Colors.black,
                  ),
                  onPressed: () {
                    widget.onToggleSave({
                      'name': widget.namaResep,
                      'img': widget.imageUrl,
                    });
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),

          // Konten Detail
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul dan Like
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.namaResep,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() => isLiked = !isLiked),
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Info Durasi & Kalori
                  Row(
                    children: [
                      _buildInfoIcon(Icons.timer_outlined, durasi),
                      const SizedBox(width: 20),
                      _buildInfoIcon(
                        Icons.local_fire_department_outlined,
                        kalori,
                      ),
                      const SizedBox(width: 20),
                      _buildInfoIcon(
                        Icons.star,
                        rating,
                        color: Colors.amber[700],
                      ),
                    ],
                  ),

                  const Divider(height: 40),

                  // Section Bahan
                  const Text(
                    "Bahan-bahan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...bahanList.map((bahan) => _buildIngredientItem(bahan)),

                  const SizedBox(height: 30),

                  // Section Langkah Memasak
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Langkah Memasak",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${langkahList.length} Langkah",
                        style: TextStyle(
                          color: Colors.amber[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // List Langkah yang Dinamis
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: langkahList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 25),
                    itemBuilder: (context, index) {
                      return _buildStepCard(langkahList[index]);
                    },
                  ),

                  const SizedBox(height: 30),
                  _buildCommentSection(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Info Icon
  Widget _buildInfoIcon(IconData icon, String text, {Color? color}) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color ?? Colors.grey[600]),
        const SizedBox(width: 5),
        Text(text, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
      ],
    );
  }

  // Widget Bahan
  Widget _buildIngredientItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 18, color: Colors.green[400]),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  // Widget Kartu Langkah Memasak yang Lengkap
  Widget _buildStepCard(Map<String, String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Langkah ${data['step']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Icon(Icons.access_time, size: 14, color: Colors.grey[500]),
            const SizedBox(width: 4),
            Text(
              data['durasi'] ?? "5 mnt",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (data['image'] != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              data['image']!,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180,
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
        const SizedBox(height: 12),
        Text(
          data['instruksi']!,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            height: 1.6,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  // Widget Area Komentar
  Widget _buildCommentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Komentar",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        TextField(
          decoration: InputDecoration(
            hintText: "Tulis komentar atau pengalaman memasak...",
            hintStyle: const TextStyle(fontSize: 14),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.send, color: Colors.amber[700]),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
