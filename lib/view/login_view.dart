import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reeder_demo1/view/register.dart';
import 'package:reeder_demo1/view/main_view.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logo(context),

                _welcome(context),
                SizedBox(height: 40),
                _inputMail(context),
                SizedBox(height: 30),
                _inputPassword(context),
                SizedBox(height: 20),
                _button(context),
                SizedBox(height: 20),
                _divider(context),
                SizedBox(height: 20),
                _register(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //LOGO ALANI
  Widget _logo(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://reeder.com.tr/media/logo/websites/3/reeder-logo.png",
          width: 200,
          height: 300,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  //HOŞGELDİNİZ ALANI
  Widget _welcome(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hoşgeldiniz',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Giriş yapmak için lütfen bilgilerinizi giriniz.',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputMail(BuildContext context) {
    return TextField(
      controller: emailController, // E-posta controller'ı
      decoration: InputDecoration(
        hintText: "E-posta adresinizi giriniz",
        labelText: "E-posta",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _inputPassword(BuildContext context) {
    return TextField(
      controller: passwordController, // Şifre controller'ı
      obscureText: true, // Şifreyi gizler
      decoration: InputDecoration(
        hintText: "Şifrenizi giriniz",
        labelText: "Şifre",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  //BUTON ALANI
  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            String email = emailController.text;
            String password = passwordController.text;

            SharedPreferences prefs = await SharedPreferences.getInstance();
            String? emailPref = prefs.getString('email');
            String? passwordPref = prefs.getString('password');

            if (email == emailPref && password == passwordPref) {
              await prefs.setBool('isLoggedIn', true);

              Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Main_View(
                        name: prefs.getString('name') ?? "",
                        email: prefs.getString('email') ?? "",
                      ),
                ),
              );
            } else {
              showDialog(
                // ignore: use_build_context_synchronously
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Hata"),
                    content: Text("E-posta veya şifre hatalı."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Kapat"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text("OTURUM AÇ"),
        ),
      ),
    );
  }

  //DİVİDER ÇİZGİSİ ALANI
  Widget _divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 3, // Çizginin yüksekliği
            width:
                MediaQuery.of(context).size.width /
                4, // Ekranın genişliğine göre
            color: const Color.fromARGB(255, 87, 83, 78), // Çizginin rengi
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: 3, // Çizginin yüksekliği
            width:
                MediaQuery.of(context).size.width /
                4, // Ekranın genişliğine göre
            color: const Color.fromARGB(255, 87, 83, 78),
          ),
        ],
      ),
    );
  }

  //KAYIT OL TEXT BUTONU ALANI
  Widget _register(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Column(
        children: [
          Text("Hala hesabınız yok mu?"),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterView()),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.green),
            child: Text("Kayıt Ol"),
          ),
        ],
      ),
    );
  }
}
