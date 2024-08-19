import 'package:flutter/material.dart';
import 'package:nothesaplama/constants/app_constants.dart';
import 'package:nothesaplama/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Sabitler.renk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OrtalamaHesaplaApp(),
    );
  }
}
