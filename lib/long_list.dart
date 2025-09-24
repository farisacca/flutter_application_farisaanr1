import 'package:flutter/material.dart';

class LongList extends StatelessWidget {
  const LongList({super.key});

  @override
  Widget build(BuildContext context) {
    //Data source: 1000 item contoh
    final List<String> items = List<String>.generate(1000, (i) => 'Item $i');

    return Scaffold(
      appBar: AppBar(title: const Text('Long List')),
      body: ListView.builder(
        itemCount: items.length,
        // prototype Item membantu Flutter mengetahui tinggi item
        prototypeItem: ListTile(title: Text(items.first)),
        itemBuilder: (context, index) {
          //setiap item berupa Listtile dengan text sesuai data source
          return ListTile(
            leading: const Icon(Icons.list_alt),
            title: Text(
              items[index],
              style: TextStyle(
                color: index % 10 == 0 ? Colors.blue : Colors.black,

              ),
            ),
          );
        },
      ), 
    );
 
  }
}