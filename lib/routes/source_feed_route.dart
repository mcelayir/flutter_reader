import 'package:flutter/material.dart';
import 'package:flutter_reader/models/source.dart';
import 'package:flutter_reader/services/rss_service.dart';
import 'package:flutter_reader/views/cards/rss_item_card.dart';
import 'package:webfeed/webfeed.dart';

class SourceFeedRoute extends StatelessWidget {

  final RssService rssService = new RssService();
  final Source source;
  SourceFeedRoute(this.source);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(source.name)),
      body: Center(
      child:
        new FutureBuilder<RssFeed>(
          future: rssService.getFeed(source.link),
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return new Container(
                  padding: new EdgeInsets.all(20.0),
                  child: new ListView.separated(
                      itemCount: snapshot.data.items.length,
                      itemBuilder: (context, index) {
                        RssItem item = snapshot.data.items[index];
                        return
                          InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: RssItemCard(context, item)
                          );
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
    )
    );
  }
}