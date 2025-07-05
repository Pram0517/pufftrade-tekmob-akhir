import 'package:flutter/material.dart';
import 'package:pufftrade/screens/main_app_screen.dart'; // Import MainAppScreen

// Halaman Verifikasi Umur untuk aplikasi PUFFTRADE
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800], // Warna latar belakang abu-abu gelap
      body: Column(
        children: <Widget>[
          // Bagian atas dengan gambar logo (tetap)
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // 40% dari tinggi layar
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300], // Warna latar belakang abu-abu terang untuk bagian gambar
              image: const DecorationImage(
                image: AssetImage('assets/login_logo.png'), // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/login_logo.png', // Ganti dengan path gambar Anda
                  width: MediaQuery.of(context).size.width * 0.5, // Ukuran logo
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          // Bagian bawah dengan teks verifikasi
          Expanded( // Menggunakan Expanded agar konten mengisi sisa ruang
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten secara vertikal
                crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan konten secara horizontal
                children: <Widget>[
                  // Menambahkan small_logo.png di sini
                  Image.asset(
                    'assets/meme.png', // Path ke small_logo.png
                    height: 80, // Ukuran sedang untuk logo
                    width: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 80,
                        width: 80,
                        color: Colors.grey[200],
                        child: const Center(
                          child: Text('Logo', style: TextStyle(fontSize: 10, color: Colors.grey)),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20), // Spasi antara logo dan teks verifikasi
                  const Text(
                    'Verifikasi Usia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Orang Lain Tidak Tau, '),
                        TextSpan(text: 'Tapi Tuhan Maha Melihat'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  // Tombol "Orang Lain Tidak Tau, Tapi Tuhan Maha Melihat"
                  TextButton(
                    onPressed: () {
                      // Navigasi ke MainAppScreen setelah verifikasi umur berhasil
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainAppScreen()),
                      );
                    },
                    child: const Text(
                      "Saya Berumur 18 Tahun atau Lebih", // Teks tombol diubah
                      style: TextStyle(
                        color: Colors.white, // Warna teks putih
                        fontSize: 18.0,
                        decoration: TextDecoration.underline, // Garis bawah
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}