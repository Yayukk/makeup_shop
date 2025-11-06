import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'name': 'Lipstick Red Velvet',
        'image':
            'https://cdn.myshoptet.com/usr/www.nadhernevlasy.cz/user/shop/big/12259_cotril-liquid-lipstick-red-velvet-rtenka-pro-intenzivni-dlouhodrzici-barevny-odstin.jpg?604267ed',
        'price': 'Rp 89.000',
        'date': '3 November 2025',
        'status': 'Selesai'
      },
      {
        'name': 'Foundation Glow Skin',
        'image':
            'https://i.pinimg.com/736x/15/89/e7/1589e7e0c86e456d8d968f581e059a72.jpg',
        'price': 'Rp 120.000',
        'date': '1 November 2025',
        'status': 'Dikirim'
      },
      {
        'name': 'Blush On Soft Pink',
        'image':
            'https://lyko.com/globalassets/product-images/isadora-nature-enhanced-cream-blush-32-soft-pink-3-g-1152-714-0032_1.jpg?ref=C22F500DB0&w=960&h=960&mode=max&quality=75&format=webp',
        'price': 'Rp 65.000',
        'date': '28 Oktober 2025',
        'status': 'Diproses'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Riwayat Pesanan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
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
                  order['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image,
                        color: Colors.grey, size: 30),
                  ),
                ),
              ),
              title: Text(
                order['name']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order['date']!,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order['status']!,
                      style: TextStyle(
                        fontSize: 13,
                        color: order['status'] == 'Selesai'
                            ? Colors.green
                            : order['status'] == 'Dikirim'
                                ? Colors.orange
                                : Colors.pink,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Text(
                order['price']!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
