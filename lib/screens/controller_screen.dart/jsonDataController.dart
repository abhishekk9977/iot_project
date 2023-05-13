import 'dart:convert';

import 'package:iot_ap/Models/dataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

Future<List<DataModel>> readJsonData() async {
  final Jsondata =
      await rootBundle.rootBundle.loadString('jsonFile/productList.json');
  final list = json.decode(Jsondata) as List<dynamic>;
  return list.map((e) => DataModel.fromJson(e)).toList();
}
