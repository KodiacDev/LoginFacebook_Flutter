import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginfacebook/home_page.dart';
import 'package:loginfacebook/home_screen.dart';
import 'package:loginfacebook/onboarding.dart';
import 'package:loginfacebook/onboarding_facebook.dart';

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

  void _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        _user = user;
        _fullName = user.displayName ?? 'Chưa có tên';
        _email = user.email;
        _photoURL = user.photoURL ?? 'https://scontent.fsgn15-1.fna.fbcdn.net/v/t39.30808-6/454637452_1169598934588116_991644084925666158_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeF2-DjnF46h4g3BUe9PtyCjlKqMwLSvuJmUqozAtK-4mQzN2hNRp6gZ5DlGn8NQGDZ-UakxzpyF-NCni_ZyW8to&_nc_ohc=0SDHYmTsNUIQ7kNvgG9qpde&_nc_zt=23&_nc_ht=scontent.fsgn15-1.fna&_nc_gid=ArnD1Wyn_P-dxIBt091Jfso&oh=00_AYBdXFdSEq8mdz1QpJQrbN2exm4tf12M4OScXHZvm4RRBA&oe=67660E60';
      });
    }
  }

  // Hàm đăng xuất
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        // Chuyển hướng về màn hình đăng nhập
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Onboarding()),
          (route) => false,
        );
      }
    } catch (e) {
      print('Lỗi khi đăng xuất: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng xuất thất bại: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ Sơ Cá Nhân'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _signOut,
            tooltip: 'Đăng xuất',
          ),
        ],
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
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        icon: Icon(Icons.logout),
                        label: Text('Đăng xuất'),
                        onPressed: _signOut,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
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
