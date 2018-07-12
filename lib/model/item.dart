import 'package:flutter/material.dart';
import 'package:serra_app/model/timer.dart';

class Item {
  String name;
  String type;
  Currency premium;
  Currency price;
  int ageInMonths;
  String photoid;
  String description;
  bool protected;
  Dependencies timer;

  Item(
      {this.name,
      this.type,
      this.premium,
      this.photoid,
      this.description,
      this.protected,
      this.timer});
}

class Currency {
  double val;
  Currency({this.val});
}
