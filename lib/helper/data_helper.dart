import 'package:flutter/material.dart';
import 'package:nothesaplama/models/ders.dart';

class DataHelper {
  static final List<Ders> tumDersler = [];

  static void dersEkle(Ders ders) {
    tumDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamKredi = 0;
    double toplamNot = 0;

    tumDersler.forEach(
      (element) {
        toplamNot += (element.harfDegeri * element.krediDegeri);
        toplamKredi += element.krediDegeri;
      },
    );

    return toplamNot / toplamKredi;
  }

  static final List _notlar = [
    'AA',
    'BA',
    'BB',
    'CB',
    'CC',
    'DC',
    'DD',
    'FD',
    'FF'
  ];

  static final List<double> _krediler = List.generate(
    10,
    (index) => index + 1,
  );

  static double _notHesapla(String not) {
    switch (not) {
      case 'AA':
        return 4;

      case 'BA':
        return 3.5;

      case 'BB':
        return 3.0;

      case 'CB':
        return 2.5;

      case 'CC':
        return 2.0;

      case 'DC':
        return 1.5;

      case 'DD':
        return 1.0;

      case 'FD':
        return 0.5;

      case 'FF':
        return 0.0;

      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _notlar
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _notHesapla(e),
          ),
        )
        .toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _krediler
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e,
          ),
        )
        .toList();
  }
}
