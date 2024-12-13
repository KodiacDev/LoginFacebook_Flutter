import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Nếu sử dụng Firebase Auth

class CheckLoginStatusPage extends StatefulWidget {
  const CheckLoginStatusPage({Key? key}) : super(key: key);

  @override
  State<CheckLoginStatusPage> createState() => _CheckLoginStatusPageState();
}

class _CheckLoginStatusPageState extends State<CheckLoginStatusPage> {
  User? currentUser; // Biến để lưu trạng thái người dùng hiện tại

  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // Kiểm tra trạng thái khi khởi tạo
  }

  // Hàm kiểm tra trạng thái đăng nhập
  void _checkLoginStatus() {
    // Nếu dùng Firebase Auth:
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      currentUser = auth.currentUser; // Kiểm tra người dùng hiện tại
    });

    // Nếu dùng phương pháp khác (SharedPreferences):
    // Example:
    // String? token = await SharedPreferences.getInstance().getString('auth_token');
    // setState(() {
    //   isLoggedIn = token != null;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiểm tra trạng thái đăng nhập'),
      ),
      body: Center(
        child: currentUser != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bạn đã đăng nhập!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email: ${currentUser!.email}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut(); // Đăng xuất
                      setState(() {
                        currentUser = null; // Cập nhật trạng thái
                      });
                    },
                    child: const Text('Đăng xuất'),
                  ),
                ],
              )
            : const Text(
                'Bạn chưa đăng nhập!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
