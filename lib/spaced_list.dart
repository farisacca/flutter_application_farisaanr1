import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SpacedList extends StatelessWidget {
  const SpacedList({super.key});

  @override
  Widget build(BuildContext context) {
      const int itemCount = 4; //jumlah item dalam list
      
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaced List'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          //layoutBuilder memberikan informasi tinggi maksimal parent
          return SingleChildScrollView(
            //agar list bisa di scroll jika tinggi layar terbatas
            child: ConstrainedBox(
              //menerapkan minimun height sesuai tinggi parent
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  itemCount,
                   (index) => Card(
                    margin: const EdgeInsets.all(8),
                    color: Colors.pink[100 * (index + 2)],
                    child: SizedBox(
                      height: 100,
                      child: Center(
                       child: Text(
                         'Item $index',
                         style: const TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),  
              ),
            ),
          );
        },
      ),  
    );
  }
}