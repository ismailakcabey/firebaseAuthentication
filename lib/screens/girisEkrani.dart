import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oturumislemleri/screens/anaSayfa.dart';

class girisEkrani extends StatefulWidget {
  @override
  _girisEkraniState createState() => _girisEkraniState();
}

class _girisEkraniState extends State<girisEkrani> {
  late String email,parola;
  var _formAnahtari = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase giris ekrani"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formAnahtari,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(18),
                  child: TextFormField(
                    onChanged: (alinanMail) {
                      setState(() {
                        email = alinanMail;
                      });
                    },
                    validator: (alinanMail) {
                      return alinanMail!.contains("@")
                          ? null
                          : "mail adresi gecersiz";
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "email giriniz",
                        hintText: "gecerli email giriniz",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: TextFormField(
                    onChanged: (alinanParola) {
                      setState(() {
                        parola = alinanParola;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "parola giriniz",
                        hintText: "gecerli parola giriniz",
                        border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  child: Padding(padding: EdgeInsets.all(18),
                    child: ElevatedButton(onPressed: (){
                      girisYap();
                    }, child: Text("giris yap")),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void girisYap() {
    if(_formAnahtari.currentState!.validate()){
     FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: parola).then((user) {
       Navigator.push(context, MaterialPageRoute(builder: (_)=>anaSayfa()));
     });
    }
  }
}
