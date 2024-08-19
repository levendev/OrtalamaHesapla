import 'package:flutter/material.dart';
import 'package:nothesaplama/constants/app_constants.dart';
import 'package:nothesaplama/helper/data_helper.dart';

class DersKredileri extends StatefulWidget {
  final Function onKredi;
  const DersKredileri({required this.onKredi, super.key});

  @override
  State<DersKredileri> createState() => _DersKredileriState();
}

class _DersKredileriState extends State<DersKredileri> {
  double _secilenKredi = 5;
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
            _secilenKredi = value!;
            widget.onKredi(_secilenKredi);
          });
        },
        value: _secilenKredi,
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
