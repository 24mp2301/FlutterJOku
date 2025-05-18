import 'package:flutter/material.dart';

class BorderedCircleImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const BorderedCircleImage({Key? key, required this.imagePath, this.size = 80})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(8), // Border width
      decoration: const BoxDecoration(
        color: Colors.white, // Border color
        shape: BoxShape.circle,
      ),
      child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover)),
    );
  }
}
