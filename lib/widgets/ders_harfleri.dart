import 'package:flutter/material.dart';
import 'package:nothesaplama/constants/app_constants.dart';
import 'package:nothesaplama/helper/data_helper.dart';

class DersHarfleri extends StatefulWidget {
  final Function onHarfler;
  const DersHarfleri({required this.onHarfler, super.key});

  @override
  State<DersHarfleri> createState() => _DersHarfleriState();
}

class _DersHarfleriState extends State<DersHarfleri> {
  double _secilenHarf = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.renk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        iconEnabledColor: Sabitler.renk.shade200,
        underline: Container(),
        onChanged: (value) {
          setState(() {
            _secilenHarf = value!;
            widget.onHarfler(_secilenHarf);
          });
        },
        value: _secilenHarf,
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
