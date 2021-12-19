

class Story{
  final String title;
  final String url;
  List<int> commentsIds=<int>[];
  Story({this.title,this.url, this.commentsIds});

  factory Story.fromJson(Map<String, dynamic> json){
    return Story(
      title: json["title"],
      url: json["url"],
      commentsIds:json['kids']== null? List<int>():json['kids'].cast<int>(),
    );
  }
}