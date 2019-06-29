import 'package:flutter/material.dart';
import 'package:flutter_reader/models/source.dart';

Widget SourceCard(BuildContext context, Source source){

  return
    new Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.all(10.0),
                width:200.0,
                height: 200.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(source.thumbnailUrl)
                    )
                )),
            SizedBox(height: 10),
            new Text(source.name,
              textScaleFactor: 1.5,
              style: new TextStyle(
                fontFamily: "Open Sans",
                fontSize: 20.0,
              ),
            )
          ],
        )
    );
}
