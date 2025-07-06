import 'package:flutter/material.dart';
import 'package:pufftrade/screens/register_screen.dart'; // Import file register_screen.dart
import 'package:pufftrade/screens/main_app_screen.dart'; // Import MainAppScreen
import 'package:pufftrade/services/auth_service.dart'; // Import AuthService

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
  bool _isLoading = false; // State untuk loading indicator

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi untuk menangani login
  Future<void> _handleLogin() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final result = await AuthService.login(email, password);

    setState(() {
      _isLoading = false;
    });

    if (result['success']) {
      // Login berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.green,
        ),
      );

      // Navigasi ke MainAppScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainAppScreen()),
      );
    } else {
      // Login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Fungsi untuk menampilkan akun yang sudah terdaftar (untuk testing)
  Future<void> _showRegisteredAccounts() async {
    final users = await AuthService.getRegisteredUsers();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          title: const Text(
            'Registered Accounts',
            style: TextStyle(color: Colors.white),
          ),
          content: users.isEmpty
              ? const Text(
                  'No accounts registered yet.',
                  style: TextStyle(color: Colors.white70),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: users.map((user) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${user['name']}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Email: ${user['email']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            Text(
                              'Password: ${user['password']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ),
          ],
        );
      },
    );
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
                  const SizedBox(height: 20.0),
                  // Informasi Gmail dan akun yang sudah dibuat
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[900]?.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.blue[300]!, width: 1),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info, color: Colors.blue[300], size: 16),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            'Only Gmail addresses are accepted. Use the account you created during registration.',
                            style: TextStyle(
                              color: Colors.blue[100],
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Input Email
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Gmail address',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[700],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      prefixIcon: Icon(Icons.email, color: Colors.grey[400]),
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
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[400]),
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
                      onPressed: _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent, // Warna tombol biru muda
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
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
                  // Tombol Debug untuk melihat akun yang sudah terdaftar
                  Center(
                    child: TextButton(
                      onPressed: _showRegisteredAccounts,
                      child: const Text(
                        'View Registered Accounts (Debug)',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
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