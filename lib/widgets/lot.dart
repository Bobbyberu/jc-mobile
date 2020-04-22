import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/models/lotDto.dart';

class Lot extends StatelessWidget {
  final LotDto lot;

  const Lot({this.lot});

  @override
  Widget build(BuildContext context) {
    return new Text(lot.name);
  }
}