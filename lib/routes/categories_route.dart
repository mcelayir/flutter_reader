import 'package:flutter/material.dart';
import 'package:flutter_reader/models/category.dart';
import 'package:flutter_reader/models/source.dart';
import 'package:flutter_reader/services/data_service.dart';
import 'package:flutter_reader/views/cards/category_header.dart';
import 'package:flutter_reader/views/cards/source_card.dart';

class CategoryRoute extends StatelessWidget {

  final DataService loader = new JsonDataService();

  List<Object> _flatten(Category category){
    final List<Object> result = new List();
    result.add(category);
    category.sources.forEach((item) => result.add(item));
    return result;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Sources')),
      body: new FutureBuilder<List<Category>>(
        future: loader.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {


            List<Object> list = new List();
            snapshot.data.forEach((item) =>
                list.addAll(_flatten(item))
            );

            return new Container(
                padding: new EdgeInsets.all(20.0),
                child: new ListView.separated(
                    itemCount: list.length,
                    itemBuilder: (context, index) {

                      Object item = list[index];
                      if(item is Category){
                        return CategoryHeader(context, item);

                      } else if(item is Source){
                        return
                          InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: SourceCard(context, item)
                          );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    })
            );
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }
          return new CircularProgressIndicator();
        },
      ),
    );
  }

}
