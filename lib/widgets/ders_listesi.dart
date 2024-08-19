import 'package:flutter/material.dart';
import 'package:nothesaplama/constants/app_constants.dart';
import 'package:nothesaplama/helper/data_helper.dart';
import 'package:nothesaplama/models/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (
              context,
              index,
            ) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: Sabitler.allPadding8,
                  child: Card(
                    color: Sabitler.renk.shade100,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor: Sabitler.renk.shade400,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(2),
                          style: Sabitler.derslerCircleAvatarTextStyle,
                        ),
                      ),
                      title: Text(tumDersler[index].dersAdi),
                      subtitle: Text('Kredi Değeri: ' +
                          tumDersler[index].krediDegeri.toString() +
                          ' Harf Değeri: ' +
                          tumDersler[index].harfDegeri.toString()),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
            "Lütfen Ders Ekleyiniz",
            style: Sabitler.baslikStyle,
          ));
  }
}
