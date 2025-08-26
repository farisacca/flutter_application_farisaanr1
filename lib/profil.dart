import 'package:flutter/material.dart';

class MyProfil extends StatelessWidget {
  const MyProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya', style: TextStyle(color: Colors.pinkAccent),),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: ClipOval(
              child: (Image.asset('images/WhatsApp Image 2025-08-12 at 11.09.18 AM.jpeg', width: 150, height: 150, fit: BoxFit.cover)),
            ),
          ),
          SizedBox(height: 10),

          Text('Parisa nur esa',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.pink)
          ),
          Text(' XI RPL 2',
          style: TextStyle(fontSize: 20, color: Colors.pink)
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          )


        ],
      ),

    );
  }
}