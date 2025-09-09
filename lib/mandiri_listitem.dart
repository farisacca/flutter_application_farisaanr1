import 'package:flutter/material.dart';

abstract class Listitem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class  HeadingItem implements Listitem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: const TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),);
  }
  
  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
  } 

  class ImageItem2 implements Listitem {
  final String label;
  final String Imageurl;
  ImageItem2(this.label, this.Imageurl);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(label, style: Theme.of( context).textTheme.titleMedium,);
  }  

  @override
  Widget buildSubtitle(BuildContext context) {
    return Image.asset(
      Imageurl,height: 200,fit: BoxFit.cover,
     );
    }
  }


class MessageItem implements Listitem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) {
    return Row(
      children: [
      Icon(Icons.message, color: Colors.pink),
      Text(sender)
      ],
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);

}

class ImageItem implements Listitem {
  final String title;
  final String imagePath;
  
  ImageItem(this.title, this.imagePath);

  @override
  Widget buildTitle(BuildContext context) => Text(title);

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();

  @override
  Widget? buildLeading(BuildContext context) {
    return Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover);
  }
}


class MandiriListitem extends StatelessWidget {
  const MandiriListitem({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Listitem> items =  List<Listitem>.generate(
      30,
      (i){
        final mod = i%5;
        if (mod == 0) {
          return HeadingItem('Heading $i');
        } else if (i % 3 == 0) {
          return ImageItem2('Image $i', 'images/vm1.jpg');
        } else {
          return MessageItem('Sender $i', 'Message body $i');
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text('List dengan Berbagai Item')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          ),
          );
        },
      ),
    );
  
  }
}