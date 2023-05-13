import 'package:flutter/cupertino.dart';

class DataModel {
  int? id;
  String? name;
  int? roboNum;
  String? imageUrl;
  DataModel({this.id, this.name, this.roboNum, this.imageUrl});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roboNum = json['roboNum'];
    imageUrl = json['imageUrl'];
  }
}
