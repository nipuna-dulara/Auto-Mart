import 'package:flutter/material.dart';

class DarkThemeCardWithImage extends StatelessWidget {
  final String imageUrl;
  final double cardWidth;
  final double cardHeight;

  DarkThemeCardWithImage({
    required this.imageUrl,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth, // Set the desired width for the card
      height: cardHeight, // Set the desired height for the card
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey[800],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.grey[900]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 12),
                Text(
                  'Toyota Prius',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'CAB-1234',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
