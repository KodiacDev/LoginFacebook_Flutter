// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:loginfacebook/home_screen.dart';
import 'package:loginfacebook/onboarding_facebook.dart';
import 'onboarding_func.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with Func {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Chiếm toàn bộ chiều ngang
        height: double.infinity, // Chiếm toàn bộ chiều cao
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"), // Đường dẫn ảnh
            fit: BoxFit.cover, // Tùy chọn hiển thị
          ),
        ),
        child: SafeArea(
          child: Center(
            // Căn giữa toàn bộ nội dung
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Chỉ chiếm không gian cần thiết
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Căn giữa nội dung bên trong
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Shop giày",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email không được để trống";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Mật khẩu không được để trống";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.orange, // Đặt màu cam cho nền
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16), // Tùy chỉnh khoảng cách
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Bo góc nút (nếu cần)
                                ),
                              ),
                              child: const Text(
                                "Đăng nhập",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Màu chữ trắng
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const FacebookAuthentication(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
