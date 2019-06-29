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
    String content = await _loadAssetFile();
    List<dynamic> parsedJson = json.decode(content);
    List<Category> categories = new List();
    parsedJson.forEach((value) => {
    categories.add(Category.fromJson(value))
    });
    return categories;
  }

  Future<String> _loadAssetFile() async {
    return await rootBundle.loadString(filePath);
  }

}

