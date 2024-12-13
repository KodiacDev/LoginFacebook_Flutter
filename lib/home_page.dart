import 'package:flutter/material.dart';
import 'package:loginfacebook/utils/news.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Bọc trong SingleChildScrollView để hỗ trợ cuộn
      child: Column(
        children: [
          NewsCard(
            urlImg: 'https://giayxshop.vn/wp-content/uploads/2022/06/z5417790301286_82146e4fff4a074951916d4bdb21c789.jpg',
            title: "MLB Chunky Liner",
            subTitle: "600.000VND",
          ),
          NewsCard(
            urlImg: 'https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-6.jpg',
            title: "Chuck Taylor All Star",
            subTitle: "600.000VND",
          ),
          NewsCard(
            urlImg: 'https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-5.jpg',
            title: "Converse Chuck Taylor",
            subTitle: "600.000VND",
          ),
          NewsCard(
            urlImg: 'https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-13.jpg',
            title: "Chuck Taylor All Star",
            subTitle: "600.000VND",
          ),
          NewsCard(
            urlImg: 'https://drake.vn/image/catalog/H%C3%ACnh%20content/gia%CC%80y%20Converse%20da%20bo%CC%81ng/giay-converse-da-bong-12.jpg',
            title: "Chuck Taylor All Star Leather Slip",
            subTitle: "600.000VND",
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String urlImg;
  final String title;
  final String subTitle;

  NewsCard({required this.urlImg, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            urlImg,
            height: 150, // Cố định chiều cao ảnh
            width: double.infinity, // Đảm bảo ảnh có chiều rộng đầy đủ
            fit: BoxFit.cover, // Đảm bảo ảnh không bị méo
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold, // Làm đậm tên sản phẩm
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              subTitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
