import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../utils/currency_formatter.dart';

class DetailPage extends StatelessWidget {
  final MenuItem item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF2C1E1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detail Menu',
          style: TextStyle(
            color: Color(0xFF2C1E1A),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            // Butir 4: Tujuan Radial Hero berupa persegi berukuran besar
            Hero(
              tag: item.id,
              createRectTween: (begin, end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  width: 240,
                  height: 240,
                  color: item.warnaAksen.withValues(alpha: 0.14),
                  child: Center(
                    child: Icon(
                      item.ikon,
                      size: 96,
                      color: item.warnaAksen,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: item.tersedia
                    ? const Color(0xFF2E7D32).withValues(alpha: 0.12)
                    : const Color(0xFFB71C1C).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item.tersedia ? 'Tersedia Hari Ini' : 'Stok Sedang Habis',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: item.tersedia
                      ? const Color(0xFF2E7D32)
                      : const Color(0xFFB71C1C),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              item.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2C1E1A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              formatRupiah(item.harga),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF6D4C41),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              item.deskripsi,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF5D4037),
              ),
            ),
            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: item.tersedia ? () => Navigator.pop(context) : null,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF3E2723),
                  disabledBackgroundColor: const Color(0xFFD7CCC8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  item.tersedia ? 'Kembali ke Katalog' : 'Menu Tidak Tersedia',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}