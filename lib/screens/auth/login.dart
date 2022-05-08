import 'package:flutter/material.dart';
import 'package:binge_watch/utility/auth_functions.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: LoginClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 10.0),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                var _email = _emailController.text;
                var _password = _passwordController.text;

                bool isLogin = await login(_email, _password);

                if (isLogin) {
                  Navigator.pushReplacementNamed(context, '/movie');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.1, height - 25, width * 0.5, height - 25);
    path.quadraticBezierTo(width * 0.95, height - 25, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
