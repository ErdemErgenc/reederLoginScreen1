import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'view/login_view.dart';
import 'view/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  String? name = prefs.getString('name');
  String? email = prefs.getString('email');

  runApp(MyApp(isLoggedIn: isLoggedIn, name: name, email: email));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? name;
  final String? email;

  const MyApp({super.key, required this.isLoggedIn, this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          isLoggedIn
              ? Main_View(name: name ?? "", email: email ?? "")
              : LoginView(),
    );
  }
}
