import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget modile;
  final Widget desktop;
  const Responsive({required this.modile, required this.desktop, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width < 600) {
      return modile;
    } else {
      return desktop;
    }
  }
}
