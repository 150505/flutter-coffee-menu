import 'package:flutter/material.dart';
import '../utils/currency_formatter.dart';

class MenuCard extends StatelessWidget {
  final String nama;
  final int harga;
  final bool tersedia;
  final String heroTag;
  final IconData ikon;
  final Color warnaAksen;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const MenuCard({
    super.key,
    required this.nama,
    required this.harga,
    required this.tersedia,
    required this.heroTag,
    required this.ikon,
    required this.warnaAksen,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final Widget cardContent = GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(14),
        // Butir 1: Satu BoxDecoration (LinearGradient, borderRadius 20, border, boxShadow)
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF5EFE6),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE6DCD2),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3E2723).withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Butir 4: Radial Hero (Lingkaran -> Persegi besar dengan lintasan melengkung)
            Hero(
              tag: heroTag,
              createRectTween: (begin, end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    final double radius =
                        Tween<double>(begin: 30.0, end: 28.0).evaluate(animation);
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Container(
                        color: warnaAksen.withValues(alpha: 0.14),
                        child: Center(
                          child: Icon(
                            ikon,
                            color: warnaAksen,
                            size: Tween<double>(begin: 28, end: 96)
                                .evaluate(animation),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 60,
                height: 60,
                // Butir 1: Ikon di dalam lingkaran (BoxShape.circle)
                decoration: BoxDecoration(
                  color: warnaAksen.withValues(alpha: 0.14),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  ikon,
                  color: warnaAksen,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C1E1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatRupiah(harga),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6D4C41),
                    ),
                  ),
                ],
              ),
            ),
            // Butir 2: Label "Habis" saat stok tidak tersedia
            if (!tersedia)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFB71C1C).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFB71C1C).withValues(alpha: 0.3),
                  ),
                ),
                child: const Text(
                  'Habis',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFB71C1C),
                  ),
                ),
              )
            else
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFA1887F),
              ),
          ],
        ),
      ),
    );

    // Butir 3: Kartu tersedia TIDAK boleh dibungkus widget Opacity
    if (tersedia) {
      return cardContent;
    }

    // Butir 2: Kartu habis dibungkus AnimatedOpacity (0.4, 400 ms)
    return AnimatedOpacity(
      opacity: 0.4,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: cardContent,
    );
  }
}