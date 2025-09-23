import 'package:flutter/material.dart';

// Abstract class untuk item list
abstract class ListItem {}

// Heading Item
class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

// Message Item
class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}

// Image Item
class ImageItem implements ListItem {
  final String title;
  final String imagePath;
  ImageItem(this.title, this.imagePath);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // biar banner debug hilang
      title: 'Flutter List Example',
      home: ListExample(),
    );
  }
}

class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Data contoh untuk ImageItem
    final imageItems = [
      ImageItem("Gunung", "images/gn.jpg"),
      ImageItem("Gunung", "images/pm.jpeg"),
      ImageItem("danau", "images/pmd.jpeg"),
    ];

    // Buat list berisi 30 item
    final items = List<ListItem>.generate(30, (i) {
      if (i % 5 == 0) {
        return HeadingItem("Heading $i");
      } else if (i % 2 == 0) {
        return MessageItem("Pengirim $i", "Pesan ke-$i");
      } else {
        // Ambil imageItem secara bergantian
        return imageItems[i % imageItems.length];
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Latihan ListView Flutter')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.heading,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (item is MessageItem) {
            return ListTile(
              leading: const Icon(Icons.message, color: Colors.pink),
              title: Text(item.sender),
              subtitle: Text(item.body),
            );
          } else if (item is ImageItem) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    height: 200, // biar gambar seragam
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}