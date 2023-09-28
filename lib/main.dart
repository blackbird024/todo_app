import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({Key? key, required this.isFirstTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: isFirstTime ? WelcomeApp(title: 'Welcome') : HomePage(title: 'HomePage'),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) => const WelcomeApp(title: 'Welcome'),
        '/route2': (BuildContext context) => HomePage(title: 'HomePage'),


      },
    );
  }
}
