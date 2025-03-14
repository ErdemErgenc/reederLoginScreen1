import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Olma Sayfası")),
      backgroundColor: Color(0xFFF4F4F4),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logo(context),
                _kayitOL(context),
                _isim(context),
                _eposta(context),
                _sifre(context),
                _sifretekrar(context),
                _kayitolbuton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,

      child: Column(
        children: [
          Image.network(
            "https://reeder.com.tr/media/logo/websites/3/reeder-logo.png",
            width: 250,
            height: 150,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _kayitOL(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kayıt ol",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "Lütfen e-posta adresi ve şifreniz ile kayıt olun.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _isim(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "İsim Soyisim",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "İsim",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _eposta(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "E-posta",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "E-posta adresinizi giriniz",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sifre(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Şifre",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Şifrenizi giriniz",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sifretekrar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Şifre Tekrar",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: passwordConfirmController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Şifrenizi tekrar giriniz",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kayitolbuton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () async {
            if (passwordController.text == passwordConfirmController.text) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('name', nameController.text);
              prefs.setString('email', emailController.text);
              prefs.setString('password', passwordController.text);

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Kayıt başarılı"),
                  duration: Duration(seconds: 2),
                ),
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Şifreler uyuşmuyor"),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Text(
            "Kayıt ol",
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
