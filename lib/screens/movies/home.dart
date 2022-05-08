import 'package:flutter/material.dart';

class MovieHome extends StatelessWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Movie Home'),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/auth/login');
      },
    );
  }
}
