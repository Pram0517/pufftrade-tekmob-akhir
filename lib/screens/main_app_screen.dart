import 'package:flutter/material.dart';
import 'package:pufftrade/screens/home_content.dart';
import 'package:pufftrade/screens/product_content.dart';
import 'package:pufftrade/screens/about_us_screen.dart'; // Import AboutUsScreen

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavigate(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 550;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            'assets/small_logo.png',
            height: 24,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _buildAppBarTextButton('Home', isSmallScreen ? 9.0 : 14.0, () => _onNavigate(0)),
            ),
            Expanded(
              child: _buildAppBarTextButton('Product', isSmallScreen ? 9.0 : 14.0, () => _onNavigate(1)),
            ),
            Expanded(
              child: _buildAppBarTextButton('About us', isSmallScreen ? 8.5 : 14.0, () {
                print('About us tapped');
                Navigator.push( // Navigasi ke AboutUsScreen
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsScreen()),
                );
              }),
            ),
            Expanded(
              child: _buildAppBarTextButton('Contact', isSmallScreen ? 9.0 : 14.0, () {
                print('Contact tapped');
                // TODO: Navigasi ke halaman Contact terpisah jika tidak ingin di PageView
              }),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.black, size: isSmallScreen ? 16 : 22),
                onPressed: () {
                  print('Account icon tapped');
                  // TODO: Navigasi ke halaman Account terpisah jika tidak ingin di PageView
                },
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomeContent(),
          ProductContent(),
        ],
      ),
      // Floating Action Button telah dihapus dari sini
    );
  }

  Widget _buildAppBarTextButton(String text, double fontSize, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}