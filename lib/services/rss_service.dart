import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';

class RssService {

  Future<RssFeed> getFeed(String url) async{
    print("fetching $url ... ");
    var response = await get(url);
    print("fetched with code: ${response.statusCode}");
    return new RssFeed.parse(response.body);
  }
}