import 'package:flutter_reader/models/category.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async' show Future;

abstract class DataService{
  Future<List<Category>> getCategories();
}

class JsonDataService extends DataService{

  static final String filePath = 'data/categories.json';

  @override
  Future<List<Category>> getCategories() async{
    String content = await rootBundle.loadString(filePath);
    List<dynamic> parsedJson = json.decode(content);
    return parsedJson.map((value) => Category.fromJson(value)).toList();
  }

}

