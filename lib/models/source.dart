class Source {
  String name;
  String thumbnailUrl;
  String link;

  Source({this.name, this.thumbnailUrl, this.link});

  factory Source.fromJson(Map<String, dynamic> map){
    return Source(
        name: map['name'],
        thumbnailUrl: map['thumbnail'],
        link: map['link']
    );
  }
}