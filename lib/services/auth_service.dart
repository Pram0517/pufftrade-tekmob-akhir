import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _usersKey = 'registered_users';
  static const String _currentUserKey = 'current_user';

  // Mendapatkan instance SharedPreferences
  static Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  // Validasi format Gmail
  static bool isValidGmail(String email) {
    final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    return gmailRegex.hasMatch(email);
  }

  // Mendapatkan daftar pengguna yang terdaftar
  static Future<List<Map<String, String>>> getRegisteredUsers() async {
    final prefs = await _prefs;
    final usersString = prefs.getString(_usersKey);
    if (usersString == null) return [];
    
    final List<dynamic> usersList = json.decode(usersString);
    return usersList.map((user) => Map<String, String>.from(user)).toList();
  }

  // Menyimpan pengguna baru
  static Future<void> saveUser(String email, String password, String name) async {
    final prefs = await _prefs;
    final users = await getRegisteredUsers();
    
    users.add({
      'email': email,
      'password': password,
      'name': name,
      'createdAt': DateTime.now().toIso8601String(),
    });
    
    await prefs.setString(_usersKey, json.encode(users));
  }

  // Memeriksa apakah email sudah terdaftar
  static Future<bool> isEmailRegistered(String email) async {
    final users = await getRegisteredUsers();
    return users.any((user) => user['email'] == email);
  }

  // Registrasi pengguna baru
  static Future<Map<String, dynamic>> register(String email, String password, String name) async {
    try {
      // Validasi Gmail
      if (!isValidGmail(email)) {
        return {
          'success': false,
          'message': 'Please use a valid Gmail address (@gmail.com)'
        };
      }

      // Validasi password
      if (password.length < 6) {
        return {
          'success': false,
          'message': 'Password must be at least 6 characters long'
        };
      }

      // Validasi nama
      if (name.trim().isEmpty) {
        return {
          'success': false,
          'message': 'Name cannot be empty'
        };
      }

      // Cek apakah email sudah terdaftar
      if (await isEmailRegistered(email)) {
        return {
          'success': false,
          'message': 'Email already registered'
        };
      }

      // Simpan pengguna baru
      await saveUser(email, password, name.trim());
      
      return {
        'success': true,
        'message': 'Registration successful! You can now login.'
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Registration failed. Please try again.'
      };
    }
  }

  // Login pengguna
  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Validasi Gmail
      if (!isValidGmail(email)) {
        return {
          'success': false,
          'message': 'Please use a valid Gmail address (@gmail.com)'
        };
      }

      // Validasi password
      if (password.isEmpty) {
        return {
          'success': false,
          'message': 'Password cannot be empty'
        };
      }

      // Ambil daftar pengguna yang terdaftar
      final users = await getRegisteredUsers();
      
      // Cari pengguna dengan email dan password yang cocok
      final user = users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => {},
      );

      if (user.isEmpty) {
        return {
          'success': false,
          'message': 'Invalid email or password'
        };
      }

      // Simpan pengguna saat ini
      final prefs = await _prefs;
      await prefs.setString(_currentUserKey, json.encode(user));

      return {
        'success': true,
        'message': 'Login successful!',
        'user': user
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Login failed. Please try again.'
      };
    }
  }

  // Mendapatkan pengguna saat ini
  static Future<Map<String, String>?> getCurrentUser() async {
    final prefs = await _prefs;
    final userString = prefs.getString(_currentUserKey);
    if (userString == null) return null;
    
    return Map<String, String>.from(json.decode(userString));
  }

  // Logout pengguna
  static Future<void> logout() async {
    final prefs = await _prefs;
    await prefs.remove(_currentUserKey);
  }

  // Menghapus semua data (untuk testing)
  static Future<void> clearAllData() async {
    final prefs = await _prefs;
    await prefs.remove(_usersKey);
    await prefs.remove(_currentUserKey);
  }
}
