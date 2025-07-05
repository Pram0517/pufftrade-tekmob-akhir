import 'package:flutter/material.dart';
import 'package:pufftrade/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String _selectedColor = 'Black'; // State untuk melacak warna yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.product.name,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.bookmark_border, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Bagian atas: Gambar Produk, Harga, Pilihan Warna, dan Rating
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Produk Utama
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      widget.product.imagePath,
                      height: 200,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Informasi Produk (Nama, Harga, Pilihan Warna, Rating)
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Mod', // Kategori produk (bisa dijadikan properti di model Product)
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Rp. ${widget.product.price?.toStringAsFixed(0) ?? 'N/A'}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Pilihan Warna
                        Wrap( // Menggunakan Wrap agar pilihan warna bisa ke baris baru jika tidak muat
                          spacing: 5.0, // Mengurangi spasi antar item
                          runSpacing: 5.0, // Spasi antar baris jika Wrap
                          children: [
                            _buildColorOption('Black', Colors.black),
                            _buildColorOption('Pink', Colors.pink),
                            _buildColorOption('Silver', Colors.grey),
                            _buildColorOption('Purple', Colors.purple),
                            // Tambahkan pilihan warna lain jika ada
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Rating
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < widget.product.rating.floor() ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Bagian Detail Produk Terstruktur
            _buildSectionTitle(context, 'Apa itu ${widget.product.name}?'),
            _buildSectionContent(context, widget.product.whatIs),

            if (widget.product.advantages.isNotEmpty) ...[
              _buildSectionTitle(context, 'Kelebihan'),
              _buildListContent(context, widget.product.advantages, isBullet: true),
            ],

            if (widget.product.disadvantages.isNotEmpty) ...[
              _buildSectionTitle(context, 'Kekurangan'),
              _buildListContent(context, widget.product.disadvantages, isBullet: true),
            ],

            _buildSectionTitle(context, 'Cara Penggunaan'),
            _buildSectionContent(context, widget.product.howToUse),

            if (widget.product.usedConditionsAndPrices.isNotEmpty) ...[
              _buildSectionTitle(context, 'Harga Jual Bekas'),
              _buildUsedPriceList(context, widget.product.usedConditionsAndPrices),
            ],

            const SizedBox(height: 40),

            // Bagian logo-logo di bagian bawah
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 40.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                    _buildBrandLogo('assets/trml_logo.png'),
                    _buildBrandLogo('assets/hotcig_logo.png'),
                    _buildBrandLogo('assets/oxva_logo.png'),
                    _buildBrandLogo('assets/dotmod_logo.png'),
                    _buildBrandLogo('assets/lostvape_logo.png'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk judul bagian
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Widget pembantu untuk konten bagian (paragraf)
  Widget _buildSectionContent(BuildContext context, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }

  // Widget pembantu untuk konten daftar (kelebihan/kekurangan)
  Widget _buildListContent(BuildContext context, List<String> items, {bool isBullet = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isBullet)
                  const Text(
                    '• ',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget pembantu untuk daftar harga bekas
  Widget _buildUsedPriceList(BuildContext context, List<Map<String, String>> prices) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: prices.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item['condition']}: ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Expanded(
                  child: Text(
                    item['price']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget pembantu untuk pilihan warna
  Widget _buildColorOption(String colorName, Color colorValue) {
    bool isSelected = _selectedColor == colorName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = colorName;
        });
      },
      child: Container(
        // Mengurangi margin dan padding lebih lanjut
        margin: const EdgeInsets.only(right: 4), // Mengurangi margin kanan
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3), // Mengurangi padding
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          colorName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 10, // Mengurangi ukuran font
          ),
        ),
      ),
    );
  }

  // Widget pembantu untuk logo brand (disalin dari home_content.dart)
  Widget _buildBrandLogo(String imagePath) {
    return Image.asset(
      imagePath,
      height: 50,
      width: 80,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 50,
          width: 80,
          color: Colors.grey[200],
          child: const Center(
            child: Text('Logo', style: TextStyle(fontSize: 10, color: Colors.grey)),
          ),
        );
      },
    );
  }
}