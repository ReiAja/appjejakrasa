import 'package:flutter/material.dart';
import 'detail_makanan.dart';

// ==================== DATA MAKANAN KHAS PROVINSI ====================

// Jawa Foods (8 items)
final List<Map<String, dynamic>> makananJawa = [
  {
    "name": "Gado-gado",
    "img": "https://assets.unileversolutions.com/recipes-v2/257673.jpg",
    "description": "Salad tradisional dengan bumbu kacang khas Betawi",
    "daerah": "DKI Jakarta - Betawi",
    "waktu": "15 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Rawon",
    "img":
        "https://assets.dapurumami.com/backup/dapurumami-test/recipe/Resep%20Rawon-YhEGKU1669005458.webp",
    "description": "Sup daging hitam khas Jawa Timur dengan kluwek",
    "daerah": "Jawa Timur - Surabaya",
    "waktu": "45 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Soto Lamongan",
    "img": "https://assets.unileversolutions.com/recipes-v2/236027.jpg",
    "description": "Soto khas Lamongan dengan serue koya udang",
    "daerah": "Jawa Timur - Lamongan",
    "waktu": "30 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Ayam Betutu",
    "img": "https://buckets.sasa.co.id/v1/AUTH_Assets/Assets/p/website/medias/page_medias/resep_ayam_betutu.jpg",
    "description": "Ayam panggang dengan bumbu rica-rica khas Bali",
    "daerah": "Bali - Gilimanuk",
    "waktu": "60 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Nasi Goreng",
    "img": "https://asset.kompas.com/crops/VcgvggZKE2VHqIAUp1pyHFXXYCs=/202x66:1000x599/1200x800/data/photo/2023/05/07/6456a450d2edd.jpg",
    "description": "Nasi goreng tradisional Indonesia paling terkenal",
    "daerah": "Jawa Barat - Bandung",
    "waktu": "20 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Sate Ayam",
    "img": "https://assets.unileversolutions.com/v1/126151706.png",
    "description": "Sate daging ayam dengan bumbu kecap manis",
    "daerah": "Jawa Tengah - Solo",
    "waktu": "25 menit",
    "porsi": "3 orang",
  },
  {
    "name": "Rendang",
    "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBvX3aS5avX-TH_6DrnvECDaJwpqBxzKYMVg&s",
    "description": "Daging sapi rica dengan santan kental",
    "daerah": "Jawa Barat - Cianjur",
    "waktu": "90 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Bakso",
    "img": "https://awsimages.detik.net.id/community/media/visual/2019/08/12/dca21bf3-923c-486f-bc2e-a3dcd759b1df_43.jpeg?w=600&q=90",
    "description": "Bola daging sapi dengan kuah kaldu pedas",
    "daerah": "Jawa Timur - Malang",
    "waktu": "30 menit",
    "porsi": "2 orang",
  },
];

// Sumatera Foods (8 items)
final List<Map<String, dynamic>> makananSumatera = [
  {
    "name": "Sate Padang",
    "img":
        "https://buckets.sasa.co.id/v1/AUTH_Assets/Assets/p/website/medias/page_medias/sate_padang.jpg",
    "description": "Sate dengan kuah santan kuning pedas khas Padang",
    "daerah": "Sumatera Barat - Padang",
    "waktu": "25 menit",
    "porsi": "3 orang",
  },
  {
    "name": "Pempek",
    "img":
        "https://asset.tribunnews.com/uKZ6TSI1W-JMSbfiBt5lH3r7_J4=/1200x675/filters:upscale():quality(30):format(webp):focal(0.5x0.5:0.5x0.5)/jogja/foto/bank/originals/Pempek-Palembang.jpg",
    "description": "Makanan laut khas Palembang terbuat dari ikan dan sagu",
    "daerah": "Sumatera Selatan - Palembang",
    "waktu": "40 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Rendang Daging",
    "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ5hXVUuKBJDzOhIQ1bwt5LIR_9hA6MxFi8w&s",
    "description": "Daging sapi rica dengan santan kental pedas",
    "daerah": "Sumatera Barat - Minangkabau",
    "waktu": "180 menit",
    "porsi": "6 orang",
  },
  {
    "name": "Soto Medan",
    "img": "https://i0.wp.com/resepkoki.id/wp-content/uploads/2016/04/Resep-Soto-medan-1.jpg?fit=1920%2C1920&ssl=1",
    "description": "Soto dengan kuah santan dan kelapa parut",
    "daerah": "Sumatera Utara - Medan",
    "waktu": "45 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Bika Ambon",
    "img": "https://cdn1-production-images-kly.akamaized.net/QDSCMLfnZLj1GJzeRwLcIjaf_b0=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/842440/original/083135300_1427970222-bikaambon.jpg",
    "description": "Kue bolu dengan tekstur spongy khas Medan",
    "daerah": "Sumatera Utara - Medan",
    "waktu": "60 menit",
    "porsi": "8 potong",
  },
  {
    "name": "Kemplang",
    "img": "https://asset.kompas.com/crops/-H7aT3q31F4xdym9UMssFAZoKaU=/0x386:667x831/1200x800/data/photo/2021/05/12/609b4a1d9af08.jpg",
    "description": "Pencit khas Palembang mirip bakso ikan",
    "daerah": "Sumatera Selatan - Palembang",
    "waktu": "30 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Laksan",
    "img": "https://i0.wp.com/resepkoki.id/wp-content/uploads/2022/04/Resep-Laksan.jpg?fit=996%2C1328&ssl=1",
    "description": "Mie tradisional khas Palembang dengan kuah pedas",
    "daerah": "Sumatera Selatan - Palembang",
    "waktu": "25 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Mi Aceh",
    "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6UZTV6jznaAsGXqQVM7FzOT-6BQXSA0s4QQ&s",
    "description": "Mi pedas khas Aceh dengan daging sapi atau seafood",
    "daerah": "Aceh - Banda Aceh",
    "waktu": "30 menit",
    "porsi": "2 orang",
  },
];

// Bali Foods (8 items)
final List<Map<String, dynamic>> makananBali = [
  {
    "name": "Babi Guling",
    "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsHYLWDaHlmtsRBU-ZpC6pI3hNrkDwLxuLng&s",
    "description": "Babi panggang khas Bali dengan bumbu lengkap",
    "daerah": "Bali - Gianyar",
    "waktu": "90 menit",
    "porsi": "6 orang",
  },
  {
    "name": "Ayam Betutu",
    "img": "https://asset.kompas.com/crops/VoJMFCaXEK_Pgm9W61uIPXmv4G8=/0x0:1000x667/1200x800/data/photo/2022/03/16/62317090c4323.jpg",
    "description": "Ayam rica dengan bumbu base genep khas Bali",
    "daerah": "Bali - Singaraja",
    "waktu": "60 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Nasi Campur Bali",
    "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZNmKBpVXj4KopfvXnclgAxw-EkCFDjsV8hA&s",
    "description": "Nasi dengan lauk pauk khas Bali",
    "daerah": "Bali - Denpasar",
    "waktu": "30 menit",
    "porsi": "1 orang",
  },
  {
    "name": "Lawar",
    "img": "https://asset.kompas.com/crops/aKHzGiCyRFfjzCWSTPWuyUd9KCs=/0x331:667x775/1200x800/data/photo/2022/06/08/62a00174befad.jpg",
    "description": "Sayuran dengan daging cincang dan kelapa",
    "daerah": "Bali - Klungkung",
    "waktu": "20 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Sate Lilit",
    "img": "https://cdn0-production-images-kly.akamaized.net/XhB4Nz0PgY_sRj3ppaVpCqytx7o=/0x436:667x812/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4859267/original/036620000_1718030900-shutterstock_2210187025.jpg",
    "description": "Sate ikan dengan bumbu rempah khas Bali",
    "daerah": "Bali - Jimbaran",
    "waktu": "25 menit",
    "porsi": "3 orang",
  },
  {
    "name": "Betik Kacang",
    "img": "https://img-global.cpcdn.com/recipes/d8bffee43f25659d/1200x630cq80/photo.jpg",
    "description": "Pisang goreng dengan taburan kacang",
    "daerah": "Bali - Badung",
    "waktu": "15 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Jaja",
    "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlkCSn69N7kkpjDSJ_NXSKDvqJoh-ymjAo-Q&s",
    "description": "Kue tradisional Bali berbagai jenis",
    "daerah": "Bali - Tabanan",
    "waktu": "45 menit",
    "porsi": "8 potong",
  },
  {
    "name": "Es Campur",
    "img": "https://cdn0-production-images-kly.akamaized.net/LvxNQRMFqmpwYfh73KTvzWbF8Ps=/0x2180:3999x4434/469x260/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3981507/original/061819300_1648783740-shutterstock_1969134643.jpg",
    "description": "Es serut dengan santan dan tape",
    "daerah": "Bali - Singaraja",
    "waktu": "10 menit",
    "porsi": "1 gelas",
  },
];

// Sulawesi Foods (8 items)
final List<Map<String, dynamic>> makananSulawesi = [
  {
    "name": "Coto Makassar",
    "img": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400",
    "description": "Sup daging dengan tauco khas Makassar",
    "daerah": "Sulawesi Selatan - Makassar",
    "waktu": "50 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Pallubasa",
    "img": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400",
    "description": "Makanan khas Makassar mirip coto tapi lebih pedas",
    "daerah": "Sulawesi Selatan - Makassar",
    "waktu": "45 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Konro",
    "img": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=400",
    "description": "Sup iga sapi khas Makassar",
    "daerah": "Sulawesi Selatan - Makassar",
    "waktu": "60 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Pisang Epe",
    "img": "https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=400",
    "description": "Pisang pipih panggang dengan gula aren",
    "daerah": "Sulawesi Selatan - Makassar",
    "waktu": "15 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Sop Konro",
    "img": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400",
    "description": "Sup iga dengan bumbu kluwek",
    "daerah": "Sulawesi Selatan - Makassar",
    "waktu": "45 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Cakkouting",
    "img": "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400",
    "description": "Mie khas Tana Toraja",
    "daerah": "Sulawesi Selatan - Toraja",
    "waktu": "25 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Bubur Kacang Hijau",
    "img": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400",
    "description": "Bubur kacang hijau dengan santan",
    "daerah": "Sulawesi Selatan - Makassar",
    "waktu": "30 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Es Pisang Ijo",
    "img": "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400",
    "description": "Pisang hijau dengan santan dan syrup",
    "daerah": "Sulawesi Selatan - Makassar",
    "waktu": "15 menit",
    "porsi": "1 gelas",
  },
];

// Papua Foods (8 items)
final List<Map<String, dynamic>> makananPapua = [
  {
    "name": "Papeda",
    "img": "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400",
    "description": "Makanan pokok dari sagu berbentuk bubur kental",
    "daerah": "Papua - Jayapura",
    "waktu": "20 menit",
    "porsi": "4 orang",
  },
  {
    "name": "Sagu Lempeng",
    "img": "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400",
    "description": "Kue sagu panggang khas Papua",
    "daerah": "Papua - Merauke",
    "waktu": "30 menit",
    "porsi": "6 orang",
  },
  {
    "name": "Ikan Bakar Papua",
    "img": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=400",
    "description": "Icanila atau ikan mujair dibakar dengan bumbu sederhana",
    "daerah": "Papua - Biak",
    "waktu": "25 menit",
    "porsi": "3 orang",
  },
  {
    "name": "Aunu Senebre",
    "img": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400",
    "description": "Sayuran khas Papua yang direbus",
    "daerah": "Papua - Jayapura",
    "waktu": "15 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Sotong Bakar",
    "img": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400",
    "description": "Cumi-cumi bakar dengan sambal",
    "daerah": "Papua - Sorong",
    "waktu": "20 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Koloke",
    "img": "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400",
    "description": "Pisang goreng khas Papua",
    "daerah": "Papua - Jayapura",
    "waktu": "10 menit",
    "porsi": "2 orang",
  },
  {
    "name": "Mie Lendir",
    "img": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400",
    "description": "Mie dengan kuah lendir khas Papua",
    "daerah": "Papua - Jayapura",
    "waktu": "20 menit",
    "porsi": "1 orang",
  },
  {
    "name": "Es Kuwut",
    "img": "https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=400",
    "description": "Es serut dengan jeruk dan selasih",
    "daerah": "Papua - Merauke",
    "waktu": "5 menit",
    "porsi": "1 gelas",
  },
];

// Province Data
final List<Map<String, dynamic>> provinces = [
  {
    "name": "Jawa",
    "icon": Icons.landscape,
    "color": Colors.amber,
    "foods": makananJawa,
    "description": "Jawa terkenal dengan cita rasa yang kaya dan beragam",
  },
  {
    "name": "Sumatera",
    "icon": Icons.waves,
    "color": Colors.green,
    "foods": makananSumatera,
    "description": "Sumatera kaya akan rempah dan hidangan pedas",
  },
  {
    "name": "Bali",
    "icon": Icons.temple_hindu,
    "color": Colors.orange,
    "foods": makananBali,
    "description": "Bali terkenal dengan masakan yang kaya bumbu base genep",
  },
  {
    "name": "Sulawesi",
    "icon": Icons.anchor,
    "color": Colors.blue,
    "foods": makananSulawesi,
    "description": "Sulawesi menawarkan hidangan laut yang lezat",
  },
  {
    "name": "Papua",
    "icon": Icons.forest,
    "color": Colors.brown,
    "foods": makananPapua,
    "description": "Papua terkenal dengan makanan pokok berbasis sagu",
  },
];

// ==================== PROVINSI PAGE (MAIN PAGE) ====================

class ProvinsiPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;

  const ProvinsiPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
  });

  @override
  State<ProvinsiPage> createState() => _ProvinsiPageState();
}

class _ProvinsiPageState extends State<ProvinsiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Provinsi Indonesia",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3436),
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Pilih Provinsi",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3436),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Jelajahi makanan khas dari setiap provinsi di Indonesia",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            ...provinces
                .map((province) => _buildProvinceCard(province))
                .toList(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildProvinceCard(Map<String, dynamic> province) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => getProvincePage(
              province['name'],
              savedRecipes: widget.savedRecipes,
              isRecipeSaved: widget.isRecipeSaved,
              onToggleSave: widget.onToggleSave,
              isGuest: widget.isGuest,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: (province['color'] as Color).withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: (province['color'] as Color).withOpacity(0.1),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
              ),
              child: Icon(
                province['icon'] as IconData,
                size: 40,
                color: province['color'] as Color,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      province['name'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3436),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      province['description'] as String,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${(province['foods'] as List).length} makanan khas",
                      style: TextStyle(
                        fontSize: 12,
                        color: province['color'] as Color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== JAWA PAGE ====================

class JawaPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;

  const JawaPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
  });

  @override
  State<JawaPage> createState() => _JawaPageState();
}

class _JawaPageState extends State<JawaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Makanan Khas Jawa",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildFoodGrid(makananJawa),
    );
  }

  Widget _buildFoodGrid(List<Map<String, dynamic>> foods) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.0,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return _buildFoodCard(foods[index]);
      },
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailResepLengkap(
              namaResep: food['name'],
              imageUrl: food['img'],
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
            image: NetworkImage(food['img']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                food['daerah'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== SUMATERA PAGE ====================

class SumateraPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;

  const SumateraPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
  });

  @override
  State<SumateraPage> createState() => _SumateraPageState();
}

class _SumateraPageState extends State<SumateraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Makanan Khas Sumatera",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildFoodGrid(makananSumatera),
    );
  }

  Widget _buildFoodGrid(List<Map<String, dynamic>> foods) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.0,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return _buildFoodCard(foods[index]);
      },
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailResepLengkap(
              namaResep: food['name'],
              imageUrl: food['img'],
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
            image: NetworkImage(food['img']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                food['daerah'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== BALI PAGE ====================

class BaliPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;

  const BaliPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
  });

  @override
  State<BaliPage> createState() => _BaliPageState();
}

class _BaliPageState extends State<BaliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Makanan Khas Bali",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildFoodGrid(makananBali),
    );
  }

  Widget _buildFoodGrid(List<Map<String, dynamic>> foods) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.0,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return _buildFoodCard(foods[index]);
      },
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailResepLengkap(
              namaResep: food['name'],
              imageUrl: food['img'],
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
            image: NetworkImage(food['img']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                food['daerah'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== SULAWESI PAGE ====================

class SulawesiPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;

  const SulawesiPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
  });

  @override
  State<SulawesiPage> createState() => _SulawesiPageState();
}

class _SulawesiPageState extends State<SulawesiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Makanan Khas Sulawesi",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildFoodGrid(makananSulawesi),
    );
  }

  Widget _buildFoodGrid(List<Map<String, dynamic>> foods) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.0,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return _buildFoodCard(foods[index]);
      },
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailResepLengkap(
              namaResep: food['name'],
              imageUrl: food['img'],
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
            image: NetworkImage(food['img']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                food['daerah'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== PAPUA PAGE ====================

class PapuaPage extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;
  final bool isGuest;

  const PapuaPage({
    super.key,
    required this.savedRecipes,
    required this.isRecipeSaved,
    required this.onToggleSave,
    this.isGuest = false,
  });

  @override
  State<PapuaPage> createState() => _PapuaPageState();
}

class _PapuaPageState extends State<PapuaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Makanan Khas Papua",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildFoodGrid(makananPapua),
    );
  }

  Widget _buildFoodGrid(List<Map<String, dynamic>> foods) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.0,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return _buildFoodCard(foods[index]);
      },
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailResepLengkap(
              namaResep: food['name'],
              imageUrl: food['img'],
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
            image: NetworkImage(food['img']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                food['daerah'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== HELPER FUNCTION ====================

Widget getProvincePage(
  String provinceName, {
  required List<Map<String, String>> savedRecipes,
  required bool Function(String) isRecipeSaved,
  required Function(Map<String, String>) onToggleSave,
  bool isGuest = false,
}) {
  switch (provinceName) {
    case 'Jawa':
      return JawaPage(
        savedRecipes: savedRecipes,
        isRecipeSaved: isRecipeSaved,
        onToggleSave: onToggleSave,
        isGuest: isGuest,
      );
    case 'Sumatera':
      return SumateraPage(
        savedRecipes: savedRecipes,
        isRecipeSaved: isRecipeSaved,
        onToggleSave: onToggleSave,
        isGuest: isGuest,
      );
    case 'Bali':
      return BaliPage(
        savedRecipes: savedRecipes,
        isRecipeSaved: isRecipeSaved,
        onToggleSave: onToggleSave,
        isGuest: isGuest,
      );
    case 'Sulawesi':
      return SulawesiPage(
        savedRecipes: savedRecipes,
        isRecipeSaved: isRecipeSaved,
        onToggleSave: onToggleSave,
        isGuest: isGuest,
      );
    case 'Papua':
      return PapuaPage(
        savedRecipes: savedRecipes,
        isRecipeSaved: isRecipeSaved,
        onToggleSave: onToggleSave,
        isGuest: isGuest,
      );
    default:
      return ProvinsiPage(
        savedRecipes: savedRecipes,
        isRecipeSaved: isRecipeSaved,
        onToggleSave: onToggleSave,
        isGuest: isGuest,
      );
  }
}
