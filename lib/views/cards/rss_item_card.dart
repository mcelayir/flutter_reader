
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';

Widget RssItemCard(BuildContext context, RssItem rssItem){

  String _getThumbUrl(){
    if(rssItem.media.thumbnails.length > 0 ){
      return rssItem.media.thumbnails[0].url;
    }else if (rssItem.enclosure != null && rssItem.enclosure.url != null && rssItem.enclosure.url != ""){
      return rssItem.enclosure.url;
    }
    return "";
  }

  double _getHeight(){
    String thumb = _getThumbUrl();
    if(thumb != "") return 300;
    return 0;
  }

  return
    new Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.all(10.0),
                height: _getHeight(),
                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(_getThumbUrl())
                    )
                )),
            SizedBox(height: 10),
            new Text(rssItem.title,
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