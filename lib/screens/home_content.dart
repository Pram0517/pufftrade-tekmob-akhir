import 'package:flutter/material.dart';
import 'package:pufftrade/models/product.dart';
import 'package:pufftrade/screens/product_detail_screen.dart';

// Konten Halaman Beranda untuk aplikasi PUFFTRADE (tanpa AppBar/Scaffold)
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // Contoh data produk (Anda bisa menggantinya dengan data dari Firebase nanti)
  final List<Product> featuredProducts = [
    Product(
      name: 'TRML T200',
      imagePath: 'assets/products/trml_t200.png',
      whatIs: 'TRML T200 adalah perangkat vaping canggih dengan daya 200 watt berbasis potensiometer. Tanpa tombol pengatur khusus, pengguna cukup memutar kenop potensiometer untuk memilih level output. Desain bodi berbahan aluminium alloy, mod ini terasa kokoh dan lebih premium daripada banyak mod lain yang masih menggunakan bahan plastik. Sebagai mod dengan output 5-200 watt dan rentang resistansi 0.07 Ω hingga 3.5 Ω, TRML T200 mampu mengakomodasi berbagai jenis atomizer. Proteksi chipset di dalamnya meliputi pencegahan short, overheat, dan low battery, menjadikannya cukup aman asal penggunaan sesuai prosedur.',
      advantages: [
        'Daya 200 watt berbasis potensiometer.',
        'Desain bodi aluminium alloy yang kokoh dan premium.',
        'Rentang resistansi luas (0.07 Ω hingga 3.5 Ω).',
        'Proteksi chipset lengkap (short, overheat, low battery).',
      ],
      disadvantages: [
        'Tidak disarankan untuk pemula tanpa riset/pengetahuan dasar.',
        'Membutuhkan pemahaman tentang Ohm\'s law.',
        'Memerlukan konsultasi dengan ahli atau vaporista.',
      ],
      howToUse: 'Untuk informasi lebih lengkap, pengguna bisa membaca manual book yang terdapat pada paket pembelian TRML T200. Bagi pengguna pemula yang sebelumnya memakai device jenis pod, TRML T200 bisa menjadi pilihan tepat dengan beberapa syarat. Pengguna disarankan untuk tidak langsung memakai mod dikarenakan jika pemula: Sudah melakukan riset tentang cara kerja electrical mod, Sudah memiliki pengetahuan dasar tentang Ohm\'s law, Sering konsultasi langsung ke toko vape atau vaporista, Sudah memiliki teman atau kenalan yang lebih senior yang lebih tebal.',
      rating: 5.0,
      price: 550000.0,
      usedConditionsAndPrices: [
        {'condition': 'Mulus (95% ke atas)', 'price': 'Rp. 450.000 - 500.000'},
        {'condition': 'Lecet ringan (80-94%)', 'price': 'Rp. 350.000 - 449.000'},
        {'condition': 'Kerusakan minor (di bawah 80%)', 'price': 'Rp. 200.000 - 349.000'},
      ],
    ),
    Product(
      name: 'Makna V2 - Berry Dough',
      imagePath: 'assets/products/makna_v2.png',
      whatIs: 'Makna V2 - Berry Dough adalah liquid premium dengan perpaduan rasa berry dan adonan kue yang manis dan lezat, memberikan pengalaman vaping yang memuaskan.',
      advantages: ['Rasa manis dan lezat.', 'Uap tebal.', 'Kemasan menarik.'],
      disadvantages: ['Harga premium.', 'Tidak cocok untuk yang tidak suka manis.'],
      howToUse: 'Isi liquid ke dalam atomizer atau pod Anda sesuai petunjuk perangkat. Kocok sebelum digunakan.',
      rating: 4.0,
      price: 120000.0,
      usedConditionsAndPrices: [], // Liquid biasanya tidak ada harga bekas
    ),
    Product(
      name: 'Oxva Xlim Pro 2',
      imagePath: 'assets/products/oxva_xlim_pro_2.png',
      whatIs: 'Oxva Xlim Pro 2 adalah pod system ringkas yang dirancang untuk kemudahan penggunaan dan performa vaping yang luar biasa, cocok untuk vaper pemula maupun berpengalaman.',
      advantages: ['Desain ramping dan portabel.', 'Rasa yang intens.', 'Baterai tahan lama.'],
      disadvantages: ['Kapasitas pod kecil.', 'Pilihan warna terbatas.'],
      howToUse: 'Isi pod dengan liquid, pasang ke perangkat, dan hirup untuk mengaktifkan. Isi daya menggunakan kabel USB-C.',
      rating: 5.0,
      price: 280000.0,
      usedConditionsAndPrices: [
        {'condition': 'Mulus (90% ke atas)', 'price': 'Rp. 200.000 - 250.000'},
        {'condition': 'Ada goresan (70-89%)', 'price': 'Rp. 150.000 - 199.000'},
      ],
    ),
    Product(
      name: 'Neutrall Toolkit',
      imagePath: 'assets/products/neutrall_toolkit.png',
      whatIs: 'Neutrall Toolkit adalah set alat lengkap yang dirancang untuk membantu vaper dalam membangun dan merawat coil serta perangkat vaping lainnya.',
      advantages: ['Alat lengkap.', 'Kualitas bahan bagus.', 'Kotak penyimpanan rapi.'],
      disadvantages: ['Harga sedikit mahal.', 'Beberapa alat mungkin jarang digunakan.'],
      howToUse: 'Gunakan alat sesuai kebutuhan untuk membangun coil, memotong kawat, atau membersihkan perangkat vaping Anda. Simpan kembali alat di kotaknya setelah digunakan.',
      rating: 4,
      price: 75000.0,
      usedConditionsAndPrices: [], // Toolkit jarang ada harga bekas
    ),
  ];

  final List<Product> latestProducts = [
    Product(
      name: 'Hotcig R99',
      imagePath: 'assets/products/hotcig_r99.png',
      whatIs: 'Hotcig R99 adalah mod vaping tangguh yang dilengkapi dengan chip canggih untuk performa stabil dan desain ergonomis yang nyaman digenggam.',
      advantages: ['Chipset responsif.', 'Desain ergonomis.', 'Daya tahan baterai baik.'],
      disadvantages: ['Ukuran agak besar.', 'Pilihan warna terbatas.'],
      howToUse: 'Pasang atomizer ke mod, nyalakan, atur watt sesuai keinginan, dan nikmati vaping Anda. Isi daya menggunakan port USB atau charger eksternal.',
      rating: 4.8,
      price: 400000.0,
      usedConditionsAndPrices: [
        {'condition': 'Mulus (90% ke atas)', 'price': 'Rp. 300.000 - 350.000'},
      ],
    ),
    Product(
      name: 'GeekVape Wenax M',
      imagePath: 'assets/products/geekvape_wenax_m.png',
      whatIs: 'GeekVape Wenax M adalah pod vape yang stylish dan mudah digunakan, ideal untuk pemula yang mencari pengalaman vaping yang sederhana namun memuaskan.',
      advantages: ['Sangat portabel.', 'Mudah digunakan.', 'Rasa yang jernih.'],
      disadvantages: ['Kapasitas baterai standar.', 'Tidak ada pengaturan daya.'],
      howToUse: 'Isi pod dengan liquid, pasang ke perangkat, dan hirup. Isi daya menggunakan kabel USB-C.',
      rating: 4.0,
      price: 320000.0,
      usedConditionsAndPrices: [],
    ),
    Product(
      name: 'BadFellas V3 - Vanilla Almond Don',
      imagePath: 'assets/products/badfellas_v3.png',
      whatIs: 'BadFellas V3 - Vanilla Almond Don adalah liquid creamy dengan perpaduan rasa vanilla yang lembut dan almond yang kaya, menciptakan profil rasa yang unik dan memanjakan lidah.',
      advantages: ['Rasa creamy yang kuat.', 'Perpaduan rasa unik.', 'Uap tebal.'],
      disadvantages: ['Mungkin terlalu manis untuk beberapa orang.', 'Harga premium.'],
      howToUse: 'Isi liquid ke dalam atomizer atau pod Anda sesuai petunjuk perangkat. Kocok sebelum digunakan.',
      rating: 4.5,
      price: 150000.0,
      usedConditionsAndPrices: [],
    ),
    Product(
      name: 'Orion AIO Mini Pod Kit',
      imagePath: 'assets/products/orion_aio_mini.png',
      whatIs: 'Orion AIO Mini Pod Kit adalah kit pod all-in-one mini yang portabel dan bertenaga, menawarkan pengalaman vaping yang serbaguna dengan berbagai pilihan coil.',
      advantages: ['Ukuran kompak.', 'Bertenaga.', 'Berbagai pilihan coil.'],
      disadvantages: ['Kapasitas liquid kecil.', 'Harga agak tinggi.'],
      howToUse: 'Pasang coil yang diinginkan, isi pod dengan liquid, pasang pod ke perangkat, dan hirup. Sesuaikan pengaturan daya jika tersedia.',
      rating: 4.0,
      price: 290000.0,
      usedConditionsAndPrices: [
        {'condition': 'Mulus (90% ke atas)', 'price': 'Rp. 220.000 - 260.000'},
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 550;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Bagian Welcome to PuffTrade
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'PuffTrade',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'This is about vaping, if you\'re underage,\ndon\'t use this app.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          print('Explore button tapped');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Explore',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/invapewetrust.png',
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.4,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: screenWidth * 0.35,
                          height: screenWidth * 0.4,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.broken_image, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Bagian Featured Products
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Featured Products',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: featuredProducts.length,
              itemBuilder: (context, index) {
                return _buildProductCard(featuredProducts[index]);
              },
            ),
          ),

          const SizedBox(height: 40),

          // Bagian Latest Products
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Latest Products',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: latestProducts.length,
              itemBuilder: (context, index) {
                return _buildProductCard(latestProducts[index]);
              },
            ),
          ),

          const SizedBox(height: 60),

          // Bagian logo-logo di bagian bawah
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: isSmallScreen ? 20.0 : 40.0,
                runSpacing: isSmallScreen ? 15.0 : 20.0,
                children: <Widget>[
                  _buildBrandLogo('assets/trml_logo.png', isSmallScreen),
                  _buildBrandLogo('assets/hotcig_logo.png', isSmallScreen),
                  _buildBrandLogo('assets/oxva_logo.png', isSmallScreen),
                  _buildBrandLogo('assets/dotmod_logo.png', isSmallScreen),
                  _buildBrandLogo('assets/lostvape_logo.png', isSmallScreen),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Widget pembantu untuk kartu produk
  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                product.imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < product.rating.floor() ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk logo brand
  Widget _buildBrandLogo(String imagePath, bool isSmallScreen) {
    return Image.asset(
      imagePath,
      height: isSmallScreen ? 40 : 50,
      width: isSmallScreen ? 60 : 80,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: isSmallScreen ? 40 : 50,
          width: isSmallScreen ? 60 : 80,
          color: Colors.grey[200],
          child: const Center(
            child: Text('Logo', style: TextStyle(fontSize: 10, color: Colors.grey)),
          ),
        );
      },
    );
  }
}