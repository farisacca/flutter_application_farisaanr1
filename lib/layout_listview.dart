import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('ListView')),
        body: ListView(
          children: [
            ListTile(leading: Icon(Icons.map),title: Text('Map')),
            ListTile(leading: Icon(Icons.photo_album),title: Text('Album')),
            ListTile(leading: Icon(Icons.phone),title: Text('Phone')),
          ],
        ),
    );
  }
}