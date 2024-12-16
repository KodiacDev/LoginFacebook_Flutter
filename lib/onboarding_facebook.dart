import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginfacebook/checklogin.dart';
import 'package:loginfacebook/logout.dart';
import 'package:loginfacebook/success.dart';
import 'package:sign_button/sign_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:status_alert/status_alert.dart';

import 'home_screen.dart'; // Đảm bảo đã import HomeScreen

class FacebookAuthentication extends StatefulWidget {
  const FacebookAuthentication({super.key});

  @override
  State<FacebookAuthentication> createState() => _FacebookAuthenticationState();
}

class _FacebookAuthenticationState extends State<FacebookAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 60,
      child: SignInButton(
        buttonType: ButtonType.facebook,
        width: MediaQuery.of(context).size.width,
        onPressed: () async {
          try {
            final UserCredential userCredential = await signInWithFacebook();
            if (context.mounted) {
              // Chuyển hướng đến trang HomeScreen sau khi đăng nhập thành công
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen())); // Chuyển qua trang HomeScreen
            }
          } catch (e) {
             StatusAlert.show(context,
                duration: const Duration(seconds: 2),
                title: 'Đăng nhập không thành công',
                subtitle: e.toString(),
                configuration: const IconConfiguration(
                    icon: Icons.close, color: Colors.red),
                maxWidth: 360);
          }
        },
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
