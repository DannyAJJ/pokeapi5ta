import 'package:flutter/material.dart';




class MyImageWidget extends StatefulWidget {
  const MyImageWidget({
    super.key,
    required this.id,
    });
    final int id;
  @override
  State<MyImageWidget> createState() => _MyImageWidgetState();
}

class _MyImageWidgetState extends State<MyImageWidget> {
  String imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/494.png';

  void _updateImage() {
    setState(() {
      // Cambia la URL de la imagen aquí
      imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.id}.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _updateImage,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}