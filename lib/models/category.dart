import 'source.dart';

class Category{
  int id;
  String name;
  List<Source> sources;

  Category({this.id, this.name, this.sources});

  factory Category.fromJson(Map<String, dynamic> map){

    List<Source> _parseSources(List<dynamic> map){
      List<Source> list = map.map((item) => Source.fromJson(item)).toList();
      return list;
    }

    return Category(
        id: map['id'],
        name: map['name'],
        sources: _parseSources(map['sources'])
    );
  }

}