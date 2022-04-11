import 'package:flutter/material.dart';

class anaSayfa extends StatefulWidget {
  const anaSayfa({Key? key}) : super(key: key);

  @override
  _anaSayfaState createState() => _anaSayfaState();
}

class _anaSayfaState extends State<anaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ana sayfa"),
      ),
      body: Container(
        child: Text("basariyla ana sayfaya girildi"),
      ),
    );
  }
}

