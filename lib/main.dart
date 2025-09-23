import 'package:flutter/material.dart';
import 'package:flutter_application_farisaanr/layout_mandiri.dart';

// import 'package:flutter_application_farisaanr/mandiri.dart';
// import 'package:flutter_application_farisaanr/profil.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "App Flutter",
      home: LayoutMandiri()
    );
  }
}
