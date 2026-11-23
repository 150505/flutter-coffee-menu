import 'package:flutter/material.dart';
import '../models/menu_item.dart';

List<MenuItem> getDaftarMenuAwal() {
  return [
    MenuItem(
      id: 'menu_1',
      nama: 'Kopi Susu Gula Aren',
      deskripsi: 'Espresso house blend dengan susu segar dan gula aren organik.',
      harga: 24000,
      ikon: Icons.coffee_rounded,
      warnaAksen: const Color(0xFF6D4C41),
    ),
    MenuItem(
      id: 'menu_2',
      nama: 'Caramel Macchiato',
      deskripsi: 'Susu steamed lembut berpadu espresso dan saus karamel buatan sendiri.',
      harga: 32000,
      ikon: Icons.local_cafe_rounded,
      warnaAksen: const Color(0xFF8D6E63),
    ),
    MenuItem(
      id: 'menu_3',
      nama: 'Japanese Iced V60',
      deskripsi: 'Seduhan manual biji Arabika Gayo dengan profil rasa buah segar.',
      harga: 28000,
      ikon: Icons.water_drop_rounded,
      warnaAksen: const Color(0xFF5D4037),
    ),
    MenuItem(
      id: 'menu_4',
      nama: 'Matcha Oat Latte',
      deskripsi: 'Bubuk Uji Matcha ceremonial grade dipadu susu gandum creamy.',
      harga: 34000,
      ikon: Icons.eco_rounded,
      warnaAksen: const Color(0xFF558B2F),
    ),
    MenuItem(
      id: 'menu_5',
      nama: 'Cold Brew Citrus',
      deskripsi: 'Kopi seduh dingin 16 jam dengan sentuhan kulit jeruk valencia.',
      harga: 29000,
      ikon: Icons.ac_unit_rounded,
      warnaAksen: const Color(0xFFEF6C00),
      tersedia: false, // Contoh status awal habis
    ),
    MenuItem(
      id: 'menu_6',
      nama: 'Classic Cappuccino',
      deskripsi: 'Keseimbangan pas antara ristretto ganda dan microfoam tebal.',
      harga: 26000,
      ikon: Icons.emoji_food_beverage_rounded,
      warnaAksen: const Color(0xFF4E342E),
    ),
    MenuItem(
      id: 'menu_7',
      nama: 'Artisan Hot Chocolate',
      deskripsi: 'Cokelat hitam 70% asal Flores dilelehkan bersama susu hangat.',
      harga: 30000,
      ikon: Icons.favorite_rounded,
      warnaAksen: const Color(0xFF3E2723),
    ),
    MenuItem(
      id: 'menu_8',
      nama: 'Earl Grey Milk Tea',
      deskripsi: 'Teh hitam bergamot aromatik diseduh perlahan dengan susu.',
      harga: 25000,
      ikon: Icons.spa_rounded,
      warnaAksen: const Color(0xFF795548),
    ),
    MenuItem(
      id: 'menu_9',
      nama: 'Butter Croissant',
      deskripsi: 'Pastry renyah berlapis mentega Prancis, dipanggang setiap pagi.',
      harga: 22000,
      ikon: Icons.bakery_dining_rounded,
      warnaAksen: const Color(0xFFD84315),
    ),
    MenuItem(
      id: 'menu_10',
      nama: 'Tiramisu Clasico',
      deskripsi: 'Krim mascarpone lembut dengan biskuit savoiardi celup espresso.',
      harga: 36000,
      ikon: Icons.cake_rounded,
      warnaAksen: const Color(0xFF5D4037),
    ),
  ];
}