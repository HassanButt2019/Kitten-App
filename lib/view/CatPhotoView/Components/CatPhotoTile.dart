import 'package:flutter/material.dart';

class CatPhotoTile extends StatelessWidget {
  const CatPhotoTile(this.imageUrl);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(const Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ))),
    );
  }
}