import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reeder_demo1/view/register.dart';
import 'package:reeder_demo1/view/main_view.dart';
import 'package:reeder_demo1/widget/custom_text_field_.dart'; // Ensure this import is correct and the MainView class is defined in this file

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                _inputMail(context),
                _inputPassword(context),
                _button(context),
                _divider(context),
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
    return Container(
      child: Column(
        children: [
          Image.network(
            "https://reeder.com.tr/media/logo/websites/3/reeder-logo.png",
            width: 200,
            height: 300,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  //HOŞGELDİNİZ ALANI
  Widget _welcome(BuildContext context) {
    return Container(
      width: double.infinity,

      child: Container(
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
            SizedBox(height: 3),
            Text(
              'Giriş yapmak için lütfen bilgilerinizi giriniz.',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //KULLANICI GİRİŞ ALANI
  Widget _inputMail(BuildContext context) {
    return CustomTextField(
      hintText: "E-posta adresinizi giriniz",
      title: "E-posta",
    );
  }

  //KULLANICI GİRİŞ ALANI
  Widget _inputPassword(BuildContext context) {
    return CustomTextField(
      hintText: "Şifrenizi giriniz",
      title: "Şifre",
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );
  }

  //BUTON ALANI
  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Container(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Main_View()),
            );
          },
          child: Text("OTURUM AÇ"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
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
    return Container(
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
            child: Text("Kayıt Ol"),
            style: TextButton.styleFrom(foregroundColor: Colors.green),
          ),
        ],
      ),
    );
  }
}
