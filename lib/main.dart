import 'package:flutter/material.dart';
import 'package:binge_watch/utility/auth_functions.dart';
import 'screens/auth/login.dart';
import 'screens/movies/home.dart';

bool isLogged = false;

Future<void> main() async {
  isLogged = await verifyToken();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BingeWatch',
      initialRoute: isLogged ? '/movie' : '/auth/login',
      routes: {
        '/movie': (context) => const MovieHome(),
        '/auth/login': (context) => LoginScreen(),
      },
    );
  }
}
