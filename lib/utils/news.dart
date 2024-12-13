// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  String urlImg;
  String title;
  String subTitle;

  NewsCard(
      {super.key,
      required this.urlImg,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(urlImg),
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}
