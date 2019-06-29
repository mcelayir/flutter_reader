import 'package:flutter/material.dart';
import 'package:flutter_reader/models/category.dart';

Widget CategoryHeader(BuildContext context, Category category){

  return ListTile(
    title: Text(category.name),
  );
}