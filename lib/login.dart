
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fromKey = GlobalKey<FormState>();
  final gmail = TextEditingController();
  final pasword = TextEditingController();

  @override
  void dispose(){
    gmail.dispose();
    pasword.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(244, 233, 255, 245),
        title: Text('Klinikku',
        style: TextStyle(color: Color.fromARGB(244, 43, 100, 86)),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 36),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset('asset/kl_app_icon_521.png',
                width: 110,
                height: 110,
              ),
              ),
            ),
            const Text('Selamat Datang',
            style: TextStyle(color: Color.fromARGB(244, 43, 100, 86), fontSize: 48),
            ),
            const Text('Masuk untuk booking konsultasi',
            style: TextStyle(color: Color.fromARGB(244, 43, 100, 86), fontSize: 28),
            ),
            Container(
              width: 300,
              color: Color.fromARGB(197, 220, 155, 155),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Masukan Gmail Kamu',
                  border: OutlineInputBorder(),
                ),
                controller: gmail,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Gmail wajib diisi';
                  }
                  return null;
                },
                onFieldSubmitted: (values) {
                  gmail.text = values;
                },
              ),
            ),
            Center(
              child: Container(
                width: 300,
                color: Color.fromARGB(197, 220, 155, 155),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan Password Anda",
                    border: OutlineInputBorder(),
                  ),
                  controller: pasword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password wajib diisi';
                    }
                    return null;
                  },
                  onFieldSubmitted: (values) {
                    pasword.text = values;
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(16)),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                if (fromKey.currentState!.validate()) {
                  print(gmail.text);
                  print(pasword.text);
                  Navigator.pushReplacementNamed(context, "/home");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}