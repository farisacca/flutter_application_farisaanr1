import 'package:flutter/material.dart';

// --- 1. Class Abstract ---
abstract class Listitem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

// --- 2. HeadingItem ---
class HeadingItem implements Listitem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall );

  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}
  
  // --- 3. MessageItem ---
  class MessageItem implements Listitem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
  }

  // Widget Utama

  class LayoutListitem extends StatelessWidget {
  const LayoutListitem({super.key});

  @override
  Widget build(BuildContext context) {
    // 4. Data contoh
    final List<Listitem> items =  List<Listitem>.generate(
      20,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    );
    
    return Scaffold(
      appBar: AppBar(title: const Text("List dengan Berbagai Item")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      ),
    );
  }
}