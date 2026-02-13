import 'package:flutter/material.dart';
import 'detail_makanan.dart';

class PopularPage extends StatefulWidget {
  final bool Function(String) isRecipeSaved;
  final Function(Map<String, String>) onToggleSave;

  const PopularPage({
    super.key,
    required this.isRecipeSaved,
    required this.onToggleSave,
  });

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
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
    {
      "name": "Rendang",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Rendang.jpg/640px-Rendang.jpg",
    },
    {
      "name": "Nasi Goreng",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Nasi_goreng_tenaga_kerja.jpg/640px-Nasi_goreng_tenaga_kerja.jpg",
    },
    {
      "name": "Soto Ayam",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Soto_ayam_AMB.jpg/640px-Soto_ayam_AMB.jpg",
    },
    {
      "name": "Bakso",
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Bakso_Mix.jpg/640px-Bakso_Mix.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Pencarian Populer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.0,
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
}
