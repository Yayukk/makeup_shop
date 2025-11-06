import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  final bool hasFavorites = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Favorit Saya',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: hasFavorites
          ? _buildFavoritesList(context)
          : _buildEmptyState(context),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_favorite.png',
              width: 180,
              height: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            const Text(
              'Belum ada produk favorit ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Temukan produk make up terbaikmu dan tambahkan ke favorit!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Jelajahi Produk',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesList(BuildContext context) {
    final favorites = [
      {
        'name': 'Lipstick Red Velvet',
        'price': 'Rp 89.000',
        'image':
            'https://cdn.myshoptet.com/usr/www.nadhernevlasy.cz/user/shop/big/12259_cotril-liquid-lipstick-red-velvet-rtenka-pro-intenzivni-dlouhodrzici-barevny-odstin.jpg?604267ed',
      },
      {
        'name': 'Foundation Glow Skin ',
        'price': 'Rp 120.000',
        'image':
            'https://i.pinimg.com/736x/15/89/e7/1589e7e0c86e456d8d968f581e059a72.jpg',
      },
      {
        'name': 'Blush On Soft Pink',
        'price': 'Rp 65.000',
        'image':
            'https://lyko.com/globalassets/product-images/isadora-nature-enhanced-cream-blush-32-soft-pink-3-g-1152-714-0032_1.jpg?ref=C22F500DB0&w=960&h=960&mode=max&quality=75&format=webp',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final item = favorites[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withValues(alpha: 0.15),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item['name']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                item['price']!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('${item['name']} dihapus dari favorit '),
                    backgroundColor: Colors.pink,
                  ),
                );
              },
              icon: const Icon(Icons.delete_outline),
              color: Colors.pink.shade400,
              tooltip: 'Hapus dari Favorit',
            ),
          ),
        );
      },
    );
  }

}