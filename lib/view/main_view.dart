import 'package:flutter/material.dart';
import 'package:reeder_demo1/view/login_view.dart';

class Main_View extends StatelessWidget {
  const Main_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("#İSİM"),
            SizedBox(width: 8), // Add some spacing between the texts
            Text("#SOYİSİM"),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Color(0xFFF4F4F4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_build(context), _build1(context)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hoşgeldiniz",
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Row(
            children: [
              Text("#İsim", style: TextStyle(fontSize: 20)),
              Text("#Soyisim", style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 3),
          Text("#E-Posta", style: TextStyle(fontSize: 20)),
          SizedBox(height: 200),
          Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Text("Çıkış Yap", style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _build1(BuildContext context) {
    return Container(height: 100, width: double.infinity, color: Colors.blue);
  }
}
