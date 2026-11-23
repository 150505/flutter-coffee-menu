import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/menu_data.dart';
import '../models/menu_item.dart';
import '../widgets/menu_card.dart';
import 'detail_page.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _spinController;
  late final List<MenuItem> _daftarMenu;

  @override
  void initState() {
    super.initState();
    _daftarMenu = getDaftarMenuAwal();

    // Butir 5: Animasi berputar terus-menerus
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    // Butir 5: Wajib dispose controller
    _spinController.dispose();
    super.dispose();
  }

  void _toggleKetersediaan(int index) {
    setState(() {
      _daftarMenu[index].tersedia = !_daftarMenu[index].tersedia;
    });
  }

  void _bukaDetail(MenuItem item) {
    // Butir 4: Durasi transisi 600 ms untuk Radial Hero
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: DetailPage(item: item),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: Text(
                'Ketuk kartu untuk detail • Tekan lama untuk ubah stok',
                style: TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF8D6E63),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Butir 3: Tampilkan 10 menu menggunakan ListView.builder
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                itemCount: _daftarMenu.length,
                itemBuilder: (context, index) {
                  final item = _daftarMenu[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: MenuCard(
                      nama: item.nama,
                      harga: item.harga,
                      tersedia: item.tersedia,
                      heroTag: item.id,
                      ikon: item.ikon,
                      warnaAksen: item.warnaAksen,
                      onTap: () => _bukaDetail(item),
                      onLongPress: () => _toggleKetersediaan(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'KEDAI SENJA',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 1.8,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8D6E63),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Daftar Menu Hari Ini',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2C1E1A),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          // Butir 5: RepaintBoundary + AnimatedBuilder + parameter child
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _spinController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _spinController.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF3E2723),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3E2723).withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.coffee_maker_rounded,
                  color: Color(0xFFFBF8F4),
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}