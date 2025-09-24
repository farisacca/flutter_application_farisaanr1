import 'package:flutter/material.dart';

class LatihanMandiri extends StatelessWidget {
  const LatihanMandiri({super.key});

  @override
  Widget build(BuildContext context) {
    const int shortItemCount = 4;
    const int longItemCount = 100;

    final List<Color> cardColors = [
      Colors.lightBlueAccent,
      Colors.greenAccent,
      Colors.yellowAccent,
      Colors.orangeAccent,
    ];

    // Warna untuk tiap 10 item (akan diulang jika lebih dari panjang list ini)
    final List<Color> sectionColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      const Color.fromARGB(255, 10, 95, 13),
      Colors.blue,
      const Color.fromARGB(255, 8, 69, 175),
      Colors.deepPurple,
      Colors.pink,
      const Color.fromARGB(255, 238, 93, 129),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaced & Long List'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Section Title
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '1. List dengan Spasi Merata',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // 4 Card berwarna
                  Column(
                    children: List.generate(shortItemCount, (index) {
                      return Card(
                        color: cardColors[index],
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              'Item ${index + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Section Title for long list
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '2. List Panjang 100 Item',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Orange bar under the title
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 12,
                    // color: Colors.orangeAccent,
                  ),

                  // List panjang
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: longItemCount,
                    itemBuilder: (context, index) {
                      final itemNumber = index + 1;
                      final colorIndex = index ~/ 10 % sectionColors.length;
                      final itemColor = sectionColors[colorIndex];

                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(
                          'Item $itemNumber',
                          style: TextStyle(
                            color: itemColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
