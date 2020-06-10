class StoryModel {
  final String title;
  final String image;
  final int id;
  final String url;

  StoryModel(this.id, this.title, {this.image, this.url});

  StoryModel.fromJson(Map<String, dynamic> json)
      : this(
    int.parse(json['id'].toString()),
          json['title'].toString(),
          image: json['image'].toString() != null
              ? json['image'].toString()
              : (json['images'].toString() != null ? json['images'][0].toString(): null),
          url: json['url'].toString() != null
              ? json['url'].toString()
              : (json['url'].toString() != null ? json['url'][0].toString(): null),
        );

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'image': image, 'url': url};
  }
}
