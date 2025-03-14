import 'package:flutter/material.dart';
import 'package:reeder_demo1/view/login_view.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Main_View extends StatelessWidget {
  final String name;
  final String email;

  const Main_View({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name), // Kullanıcının adını göster
            SizedBox(width: 8),
            Text(email), // Kullanıcının e-posta adresini göster
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Color(0xFFF4F4F4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hoşgeldiniz, $name", // Kullanıcının adını göster
                style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setBool('isLoggedIn', false); // Oturumu kapat
                    Navigator.pushReplacement(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    ); // LoginView'e yönlendir
                  });
                },
                child: Text("Çıkış Yap", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
