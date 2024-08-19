import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nothesaplama/constants/app_constants.dart';
import 'package:nothesaplama/helper/data_helper.dart';
import 'package:nothesaplama/models/ders.dart';
import 'package:nothesaplama/widgets/ders_harfleri.dart';
import 'package:nothesaplama/widgets/ders_kredileri.dart';
import 'package:nothesaplama/widgets/ders_listesi.dart';
import 'package:nothesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  const OrtalamaHesaplaApp({super.key});

  @override
  State<OrtalamaHesaplaApp> createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  String _girilenDersAdi = '';
  double _secilenHarf = 4;
  double _secilenKredi = 5;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
            child: Text(
              style: Sabitler.baslikStyle,
              Sabitler.baslikText,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildForm(),
            Expanded(
              child: DersListesi(
                onElemanCikarildi: (value) {
                  setState(() {
                    DataHelper.tumDersler.removeAt(value);
                  });
                },
              ),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: Sabitler.allPadding8,
                  child: _builderTextFormField(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: Sabitler.yatayPadding8,
                          child: DersHarfleri(
                            onHarfler: (value) {
                              _secilenHarf = value;
                            },
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding: Sabitler.yatayPadding8,
                          child: DersKredileri(
                            onKredi: (value) {
                              _secilenKredi = value;
                            },
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        _dersEkleveNotHesapla();
                      },
                      icon: Icon(Icons.arrow_forward_ios_sharp),
                      iconSize: 30,
                      color: Sabitler.renk,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: OrtalamaGoster(
                ortalama: DataHelper.ortalamaHesapla(),
                dersSayisi: DataHelper.tumDersler.length),
          ),
        ],
      ),
    );
  }

  Widget _builderTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.length <= 0) {
          return 'Lütfen ders ismini giriniz.';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        _girilenDersAdi = newValue!;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        hintText: 'Ders Adı Giriniz',
        filled: true,
        fillColor: Sabitler.renk.shade100.withOpacity(0.3),
      ),
    );
  }

  void _dersEkleveNotHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          dersAdi: _girilenDersAdi,
          harfDegeri: _secilenHarf,
          krediDegeri: _secilenKredi);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
