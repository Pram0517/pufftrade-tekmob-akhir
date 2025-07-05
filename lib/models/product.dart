class Product {
  final String name;
  final String imagePath;
  final String whatIs; // Penjelasan tentang produk itu sendiri
  final List<String> advantages; // Daftar kelebihan
  final List<String> disadvantages; // Daftar kekurangan
  final String howToUse; // Cara penggunaan
  final double rating;
  final double? price; // Harga baru
  final List<Map<String, String>> usedConditionsAndPrices; // Harga bekas berdasarkan kondisi

  Product({
    required this.name,
    required this.imagePath,
    required this.whatIs,
    required this.advantages,
    required this.disadvantages,
    required this.howToUse,
    this.rating = 0.0,
    this.price,
    this.usedConditionsAndPrices = const [], // Default kosong jika tidak ada harga bekas
  });
}