import 'package:mvvm_hackerapi/Models/Story.dart';

class StoryViewModel{
  final Story story;

  StoryViewModel({this.story});

  String get title{
    return this.story.title;
  }

  String get url{
    return this.story.url;
  }

   int get noOfComments{
    return this.story.commentsIds.length;
}
}