import 'package:flutter/material.dart';
import 'package:pufftrade/models/product.dart';
import 'package:pufftrade/screens/product_detail_screen.dart';

// Konten Halaman Daftar Produk (tanpa AppBar/Scaffold)
class ProductContent extends StatefulWidget {
  const ProductContent({super.key});

  @override
  State<ProductContent> createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedFilter = 'All'; // Contoh filter

  // Data produk contoh (bisa diambil dari Firebase nanti)
  final List<Product> _allProducts = [
    Product(
      name: 'TRML T200',
      imagePath: 'assets/images/trmlt200.png',
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
      rating: 4.5,
      price: 550000.0,
      usedConditionsAndPrices: [
        {'condition': 'Mulus (95% ke atas)', 'price': 'Rp. 450.000 - 500.000'},
        {'condition': 'Lecet ringan (80-94%)', 'price': 'Rp. 350.000 - 449.000'},
        {'condition': 'Kerusakan minor (di bawah 80%)', 'price': 'Rp. 200.000 - 349.000'},
      ],
    ),
    Product(
      name: 'Makna V2 - Berry Dough',
      imagePath: 'assets/images/makna.jpg',
      whatIs: 'Makna V2 - Berry Dough adalah liquid premium dengan perpaduan rasa berry dan adonan kue yang manis dan lezat, memberikan pengalaman vaping yang memuaskan.',
      advantages: ['Rasa manis dan lezat.', 'Uap tebal.', 'Kemasan menarik.'],
      disadvantages: ['Harga premium.', 'Tidak cocok untuk yang tidak suka manis.'],
      howToUse: 'Isi liquid ke dalam atomizer atau pod Anda sesuai petunjuk perangkat. Kocok sebelum digunakan.',
      rating: 4.0,
      price: 120000.0,
      usedConditionsAndPrices: [],
    ),
    Product(
      name: 'Oxva Xlim Pro 2',
      imagePath: 'assets/images/oxva-xlim.jpeg',
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
      imagePath: 'https://img.vawoo.com/images/thumbnails/340/370/detailed/339/vaping-took-kit-diy-kit-16.jpg',
      whatIs: 'Neutrall Toolkit adalah set alat lengkap yang dirancang untuk membantu vaper dalam membangun dan merawat coil serta perangkat vaping lainnya.',
      advantages: ['Alat lengkap.', 'Kualitas bahan bagus.', 'Kotak penyimpanan rapi.'],
      disadvantages: ['Harga sedikit mahal.', 'Beberapa alat mungkin jarang digunakan.'],
      howToUse: 'Gunakan alat sesuai kebutuhan untuk membangun coil, memotong kawat, atau membersihkan perangkat vaping Anda. Simpan kembali alat di kotaknya setelah digunakan.',
      rating: 3.5,
      price: 75000.0,
      usedConditionsAndPrices: [],
    ),
    Product(
      name: 'Hotcig R99',
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj_7g0hVYsTQVtyQqkbtdBzHn75mI3Bx--bw&s',
      whatIs: 'Hotcig R99 adalah mod vaping tangguh yang dilengkapi dengan chip canggih untuk performa stabil dan desain ergonomis yang nyaman digenggam.',
      advantages: ['Chipset responsif.', 'Desain ergonomis.', 'Daya tahan baterai baik.'],
      disadvantages: ['Ukuran agak besar.', 'Pilihan warna terbatas.'],
      howToUse: 'Pasang atomizer ke mod, nyalakan, atur watt sesuai keinginan, dan nikmati vaping Anda. Isi daya menggunakan port USB atau charger eksternal.',
      rating: 4.0,
      price: 400000.0,
      usedConditionsAndPrices: [
        {'condition': 'Mulus (90% ke atas)', 'price': 'Rp. 300.000 - 350.000'},
      ],
    ),
    Product(
      name: 'GeekVape Wenax M',
      imagePath: 'https://img.vawoo.com/images/detailed/345/earth_art.jpg',
      whatIs: 'GeekVape Wenax M adalah pod vape yang stylish dan mudah digunakan, ideal untuk pemula yang mencari pengalaman vaping yang sederhana namun memuaskan.',
      advantages: ['Sangat portabel.', 'Mudah digunakan.', 'Rasa yang jernih.'],
      disadvantages: ['Kapasitas baterai standar.', 'Tidak ada pengaturan daya.'],
      howToUse: 'Isi pod dengan liquid, pasang ke perangkat, dan hirup. Isi daya menggunakan kabel USB-C.',
      rating: 4.5,
      price: 320000.0,
      usedConditionsAndPrices: [],
    ),
    Product(
      name: 'BadFellas V3 - Vanilla Almond Don',
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2eVWREcBuZGGplmEO27ar_Y0rNac733mi4g&s',
      whatIs: 'BadFellas V3 - Vanilla Almond Don adalah liquid creamy dengan perpaduan rasa vanilla yang lembut dan almond yang kaya, menciptakan profil rasa yang unik dan memanjakan lidah.',
      advantages: ['Rasa creamy yang kuat.', 'Perpaduan rasa unik.', 'Uap tebal.'],
      disadvantages: ['Mungkin terlalu manis untuk beberapa orang.', 'Harga premium.'],
      howToUse: 'Isi liquid ke dalam atomizer atau pod Anda sesuai petunjuk perangkat. Kocok sebelum digunakan.',
      rating: 4.0,
      price: 150000.0,
      usedConditionsAndPrices: [],
    ),
    Product(
      name: 'Orion AIO Mini Pod Kit',
      imagePath: 'assets/images/orion-aio-mini-pod-kit.jpeg',
      whatIs: 'Orion AIO Mini Pod Kit adalah kit pod all-in-one mini yang portabel dan bertenaga, menawarkan pengalaman vaping yang serbaguna dengan berbagai pilihan coil.',
      advantages: ['Ukuran kompak.', 'Bertenaga.', 'Berbagai pilihan coil.'],
      disadvantages: ['Kapasitas liquid kecil.', 'Harga agak tinggi.'],
      howToUse: 'Pasang coil yang diinginkan, isi pod dengan liquid, pasang pod ke perangkat, dan hirup. Sesuaikan pengaturan daya jika tersedia.',
      rating: 3.0,
      price: 290000.0,
      usedConditionsAndPrices: [
        {'condition': 'Mulus (90% ke atas)', 'price': 'Rp. 220.000 - 260.000'},
      ],
    ),
  ];

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts; // Tampilkan semua produk di awal
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _applyFilterAndSearch();
    });
  }

  void _applyFilterAndSearch() {
    _filteredProducts = _allProducts.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.whatIs.toLowerCase().contains(_searchQuery.toLowerCase()); // Mencari juga di whatIs
      // Anda bisa menambahkan logika filter berdasarkan kategori atau properti lain di sini
      // Contoh: final matchesFilter = _selectedFilter == 'All' || product.category == _selectedFilter;
      return matchesSearch; // && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search PuffTrade',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Filter Button (Contoh sederhana)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      print('Filter search tapped');
                      _showFilterDialog(context);
                    },
                    icon: const Icon(Icons.filter_list, color: Colors.black, size: 18),
                    label: const Text(
                      'Filter search...',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Daftar Produk
        Expanded(
          child: _filteredProducts.isEmpty
              ? const Center(
                  child: Text(
                    'No products found.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = _filteredProducts[index];
                    return _buildProductListItem(product);
                  },
                ),
        ),
      ],
    );
  }

  // Widget untuk menampilkan setiap item produk dalam daftar
  Widget _buildProductListItem(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Produk
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12.0),
              // Detail Produk
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Rp. ${product.price?.toStringAsFixed(0) ?? 'N/A'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      product.whatIs, // Menampilkan whatIs sebagai deskripsi singkat
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
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
      ),
    );
  }

  // Dialog untuk Filter (Contoh sederhana)
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter Products'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Contoh opsi filter
              RadioListTile<String>(
                title: const Text('All'),
                value: 'All',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                    _applyFilterAndSearch();
                    Navigator.pop(context);
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mods'),
                value: 'Mods',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                    // TODO: Implementasi filter berdasarkan kategori "Mods"
                    _applyFilterAndSearch();
                    Navigator.pop(context);
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Liquids'),
                value: 'Liquids',
                groupValue: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                    // TODO: Implementasi filter berdasarkan kategori "Liquids"
                    _applyFilterAndSearch();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}