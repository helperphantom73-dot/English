import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NeonBackground extends StatelessWidget {
  final Widget child;
  const NeonBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070913),
      body: Stack(
        children: [
          Positioned(
            top: -70,
            left: -50,
            child: Container(
              width: 280,
              height: 280,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFF007F)),
            )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .scale(begin: const Offset(1, 1), end: const Offset(1.3, 1.3), duration: 4.seconds)
            .moveXY(end: 35, duration: 5.seconds),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF00E5FF)),
            )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .scale(begin: const Offset(1.2, 1.2), end: const Offset(0.9, 0.9), duration: 6.seconds)
            .moveXY(end: -40, duration: 4.seconds),
          ),
          child,
        ],
      ),
    );
  }
}
