import 'package:flutter/material.dart';
import 'package:pufftrade/screens/register_screen.dart'; // Import file register_screen.dart
import 'package:pufftrade/screens/main_app_screen.dart'; // Import MainAppScreen

// Halaman Login untuk aplikasi PUFFTRADE
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // State untuk mengontrol visibilitas password

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800], // Warna latar belakang abu-abu gelap
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Bagian atas dengan gambar logo
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
                  // Ini adalah placeholder untuk gambar logo Anda.
                  // Pastikan Anda menambahkan gambar 'login_logo.png' ke folder 'assets'
                  // dan mendeklarasikannya di pubspec.yaml.
                  Image.asset(
                    'assets/login_logo.png', // Ganti dengan path gambar Anda
                    width: MediaQuery.of(context).size.width * 0.5, // Ukuran logo
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            // Bagian bawah dengan form login
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Login to your account',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Input Email
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[700],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20.0),
                  // Input Password
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible, // Menggunakan state _isPasswordVisible
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[700],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton( // Mengubah Icon menjadi IconButton
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off, // Mengubah ikon berdasarkan state
                          color: Colors.grey[400],
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible; // Mengubah state saat ikon diklik
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  // Forgot Password?
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Implementasi logika Forgot Password
                        print('Forgot Password? tapped');
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Tombol Login
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implementasi logika Login
                        print('Login button tapped');
                        print('Email: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                        // Navigasi langsung ke MainAppScreen setelah login berhasil
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainAppScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent, // Warna tombol biru muda
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Create Now
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        // Navigasi ke halaman Register
                        print('Create Now tapped');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Create Now',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}