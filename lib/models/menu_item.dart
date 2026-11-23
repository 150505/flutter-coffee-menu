import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String nama;
  final String deskripsi;
  final int harga;
  final IconData ikon;
  final Color warnaAksen;
  bool tersedia;

  MenuItem({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.ikon,
    required this.warnaAksen,
    this.tersedia = true,
  });
}