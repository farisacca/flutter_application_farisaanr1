import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Horizontal')),
      body: SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(width: 160,color: Colors.red),
            Container(width: 160,color: Colors.orange),
            Container(width: 160,color: Colors.yellow),
            Container(width: 160,color: Colors.green),
            Container(width: 160,color: Colors.blue),
            Container(width: 160,color: Colors.purple),
          ],
        ),
      ),
    );
  }
}