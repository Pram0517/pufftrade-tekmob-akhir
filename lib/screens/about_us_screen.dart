import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 550; // Sesuaikan dengan definisi layar kecil Anda

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan konten secara horizontal
          children: <Widget>[
            const SizedBox(height: 40),
            // Judul "About Us"
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Konten Deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'PuffTrade dirancang sebagai sumber daya utama bagi para vaper, sebuah aplikasi yang didedikasikan untuk menyediakan informasi komprehensif tentang dunia vaping. Berbeda dengan marketplace jual beli, fungsi inti PuffTrade adalah sebagai perpustakaan digital yang kaya akan data mengenai berbagai produk vape, mulai dari perangkat keras hingga liquid, serta informasi harga yang relevan di pasaran.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center, // Pusatkan teks
              ),
            ),
            const SizedBox(height: 60),
            // Bagian logo-logo di bagian bawah (disalin dari home_content.dart)
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
      ),
    );
  }

  // Widget pembantu untuk logo brand (disalin dari home_content.dart)
  Widget _buildBrandLogo(String imagePath, bool isSmallScreen) {
    return Image.asset(
      imagePath,
      height: isSmallScreen ? 40 : 50,
      width: isSmallScreen ? 60 : 80,
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