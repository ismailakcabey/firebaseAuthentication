import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oturumislemleri/screens/kayitEkrani.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: KayitUygulama(),
  ));
}

class KayitUygulama extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return kayitEkrani();
  }
}