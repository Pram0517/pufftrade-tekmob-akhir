import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String? currentName;
  final String? currentEmail;
  final String? currentLocation;
  final String? currentPhone;
  final String? currentImageUrl;
  
  const EditProfileScreen({
    super.key,
    this.currentName,
    this.currentEmail,
    this.currentLocation,
    this.currentPhone,
    this.currentImageUrl,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  
  String _selectedDay = '16';
  String _selectedMonth = '09';
  String _selectedYear = '2004';
  String _profileImageUrl = '';
  
  @override
  void initState() {
    super.initState();
    // Initialize with existing data
    _nameController.text = widget.currentName ?? 'Pramudinhaq';
    _usernameController.text = 'Pramudinhaq';
    _passwordController.text = 'password123';
    _emailController.text = widget.currentEmail ?? 'Pramudinhaq@gmail.com';
    _cityController.text = widget.currentLocation ?? 'Bantul, Yogyakarta';
    _phoneController.text = widget.currentPhone ?? '+62 812-3456-7890';
    _profileImageUrl = widget.currentImageUrl ?? 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop&crop=face';
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Return the updated data to the previous screen
    final updatedData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'location': _cityController.text,
      'phone': _phoneController.text,
      'profileImageUrl': _profileImageUrl,
    };
    
    Navigator.pop(context, updatedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Profile Picture
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop&crop=face',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Change Photo Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Ubah',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Form Fields
              _buildTextField(
                controller: _nameController,
                hintText: 'Nama*',
                prefixIcon: Icons.person_outline,
              ),
              
              const SizedBox(height: 16),
              
              _buildTextField(
                controller: _usernameController,
                hintText: 'Username*',
                prefixIcon: Icons.alternate_email,
              ),
              
              const SizedBox(height: 16),
              
              _buildTextField(
                controller: _passwordController,
                hintText: 'Kata Sandi*',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
              ),
              
              const SizedBox(height: 16),
              
              _buildTextField(
                controller: _emailController,
                hintText: 'Alamat Email*',
                prefixIcon: Icons.email_outlined,
              ),
              
              const SizedBox(height: 16),
              
              _buildTextField(
                controller: _phoneController,
                hintText: 'Nomor Telepon*',
                prefixIcon: Icons.phone_outlined,
              ),
              
              const SizedBox(height: 16),
              
              _buildTextField(
                controller: _cityController,
                hintText: 'Kota*',
                prefixIcon: Icons.location_on_outlined,
                suffixIcon: Icons.my_location,
              ),
              
              const SizedBox(height: 24),
              
              // Date of Birth Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tanggal Lahir',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Date Picker Row
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDropdown(_selectedDay, ['16', '15', '14', '13', '12'], (value) {
                      setState(() {
                        _selectedDay = value!;
                      });
                    }),
                    _buildDropdown(_selectedMonth, ['09', '08', '07', '06', '05'], (value) {
                      setState(() {
                        _selectedMonth = value!;
                      });
                    }),
                    _buildDropdown(_selectedYear, ['2004', '2003', '2002', '2001', '2000'], (value) {
                      setState(() {
                        _selectedYear = value!;
                      });
                    }),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Save Button
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {
                    // Save profile changes
                    _saveProfile();
                  },
                  child: const Text(
                    'Simpan perubahan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Brand Logos
             
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    IconData? suffixIcon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey.shade600,
            size: 20,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: Colors.grey.shade600,
                  size: 20,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
  
  Widget _buildDropdown(String value, List<String> items, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        underline: Container(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 16,
        ),
      ),
    );
  }
  
 
}
