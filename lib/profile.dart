import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user;
  String? _fullName;
  String? _email;
  String? _photoURL;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Lấy thông tin người dùng từ Firebase Authentication và Firestore
void _getUserData() async {
  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Lấy thông tin người dùng từ Firestore
    try {
      // Lấy tài liệu người dùng từ Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      // Kiểm tra xem tài liệu có tồn tại không
      if (userDoc.exists) {
        // Cập nhật các giá trị từ Firestore
        setState(() {
          _user = user;
          _fullName = userDoc['fullName'] ?? user.displayName ?? 'Chưa có tên';
          _email = user.email;
          _photoURL = 'https://scontent.fsgn15-1.fna.fbcdn.net/v/t39.30808-6/444770756_493498203100405_602131800872719834_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHrU9W_yX6eQZA6cQtnyOkg-eYwI77nO1n55jAjvuc7Wezj3ORebYtf1UeyQE-muHd6cN0v9yzADHpi_3k20c_A&_nc_ohc=1QriCTMJl5IQ7kNvgEw8X6j&_nc_zt=23&_nc_ht=scontent.fsgn15-1.fna&_nc_gid=AC5G4bUStQze8m6JhLkxyJB&oh=00_AYDQjSO4z55eLWLs9i5eBIfifjgZ0vc4ocO8RMjLYfmCHw&oe=6757311E' ?? 'https://scontent.fsgn15-1.fna.fbcdn.net/v/t39.30808-6/444770756_493498203100405_602131800872719834_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHrU9W_yX6eQZA6cQtnyOkg-eYwI77nO1n55jAjvuc7Wezj3ORebYtf1UeyQE-muHd6cN0v9yzADHpi_3k20c_A&_nc_ohc=1QriCTMJl5IQ7kNvgEw8X6j&_nc_zt=23&_nc_ht=scontent.fsgn15-1.fna&_nc_gid=AC5G4bUStQze8m6JhLkxyJB&oh=00_AYDQjSO4z55eLWLs9i5eBIfifjgZ0vc4ocO8RMjLYfmCHw&oe=6757311E';
        });
      } else {
        // Nếu không có tài liệu người dùng, vẫn giữ thông tin từ FirebaseAuth
        setState(() {
          _user = user;
          _fullName = user.displayName ?? 'Chưa có tên';
          _email = user.email;
          _photoURL = user.photoURL ?? 'https://via.placeholder.com/150';
        });
      }
    } catch (e) {
      print('Lỗi khi lấy dữ liệu người dùng từ Firestore: $e');
      // Nếu có lỗi, vẫn sử dụng thông tin từ FirebaseAuth
      setState(() {
        _user = user;
        _fullName = user.displayName ?? 'Chưa có tên';
        _email = user.email;
        _photoURL = 'https://scontent.fsgn15-1.fna.fbcdn.net/v/t39.30808-6/444770756_493498203100405_602131800872719834_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHrU9W_yX6eQZA6cQtnyOkg-eYwI77nO1n55jAjvuc7Wezj3ORebYtf1UeyQE-muHd6cN0v9yzADHpi_3k20c_A&_nc_ohc=1QriCTMJl5IQ7kNvgEw8X6j&_nc_zt=23&_nc_ht=scontent.fsgn15-1.fna&_nc_gid=AC5G4bUStQze8m6JhLkxyJB&oh=00_AYDQjSO4z55eLWLs9i5eBIfifjgZ0vc4ocO8RMjLYfmCHw&oe=6757311E' ?? 'https://via.placeholder.com/150';
      });
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ Sơ Cá Nhân'),
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(_photoURL!),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Tên người dùng",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        "Tên: $_fullName",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Email: $_email",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
