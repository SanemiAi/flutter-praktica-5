import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Карточка товара',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const ProductCardPage(),
    );
  }
}

class ProductCardPage extends StatelessWidget {
  const ProductCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин'),
      ),
      body: const Center(
        child: ProductCard(),
      ),
    );
  }
}

/// Карточка товара: Column внутри Container с рамкой.
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      // Рамка вокруг всей карточки
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок товара
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Беспроводные наушники SoundMax Pro',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Картинка товара
          Image.network(
            'https://picsum.photos/seed/headphones/600/400',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            // Пока картинка грузится — показываем индикатор
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const SizedBox(
                height: 180,
                child: Center(child: CircularProgressIndicator()),
              );
            },
            // Если картинка недоступна — показываем заглушку
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 180,
                child: Center(
                  child: Icon(Icons.headphones, size: 80, color: Colors.grey),
                ),
              );
            },
          ),

          // Описание в Container с отступами
          Container(
            padding: const EdgeInsets.all(12.0),
            child: const Text(
              'Наушники с активным шумоподавлением, до 40 часов работы '
              'от аккумулятора и быстрой зарядкой USB-C.',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),

          // Цена и рейтинг в одной строке
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5 990 ₽',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '★ 4.8',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
