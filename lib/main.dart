import 'package:flutter/material.dart';
import 'package:login/user/sin_in.dart';
import 'package:login/user/sin_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth ',
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
