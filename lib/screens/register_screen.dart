import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal
import 'package:pufftrade/services/auth_service.dart'; // Import AuthService

// Halaman Registrasi untuk aplikasi PUFFTRADE
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(); // Controller untuk Tanggal Lahir
  bool _isLoading = false; // State untuk loading indicator

  DateTime? _selectedDate; // Untuk menyimpan tanggal lahir yang dipilih

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  // Fungsi untuk menangani registrasi
  Future<void> _handleRegister() async {
    if (_isLoading) return;

    // Validasi Tanggal Lahir
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon pilih tanggal lahir Anda.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    int age = _calculateAge(_selectedDate!);
    if (age < 18) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Anda harus berumur 18 tahun atau lebih untuk menggunakan aplikasi ini.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final name = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final result = await AuthService.register(email, password, name);

    setState(() {
      _isLoading = false;
    });

    if (result['success']) {
      // Registrasi berhasil - tampilkan dialog konfirmasi
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 30),
                const SizedBox(width: 10),
                const Text(
                  'Registration Successful!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            content: const Text(
              'Your account has been created successfully. You can now login with your Gmail account and password.',
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
                  Navigator.of(context).pop(); // Kembali ke halaman login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Go to Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    } else {
      // Registrasi gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Fungsi untuk menampilkan DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('dd MMMM yyyy').format(picked); // Format tanggal untuk tampilan
      });
    }
  }

  // Fungsi untuk menghitung umur
  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
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
                  Image.asset(
                    'assets/login_logo.png', // Ganti dengan path gambar Anda
                    width: MediaQuery.of(context).size.width * 0.5, // Ukuran logo
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            // Bagian bawah dengan form registrasi
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Create a new account',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Informasi Gmail dan proses registrasi
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green[900]?.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.green[300]!, width: 1),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info, color: Colors.green[300], size: 16),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            'Only Gmail addresses are accepted. After successful registration, you will be redirected to login page.',
                            style: TextStyle(
                              color: Colors.green[100],
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Input Username
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
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
                  ),
                  const SizedBox(height: 20.0),
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
                  // Input Mobile Number
                  TextField(
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
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
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20.0),
                  // Input Tanggal Lahir
                  TextField(
                    controller: _dobController,
                    readOnly: true, // Membuat field hanya bisa dipilih, tidak diketik
                    onTap: () => _selectDate(context), // Memanggil date picker saat ditekan
                    decoration: InputDecoration(
                      hintText: 'Tanggal Lahir (DD/MM/YYYY)',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[700],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[400]),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20.0),
                  // Input Password
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[700],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off, // Ikon mata tertutup
                        color: Colors.grey[400],
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30.0),
                  // Tombol Register
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleRegister,
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
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Login
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        // Navigasi kembali ke halaman Login
                        print('Login tapped');
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
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