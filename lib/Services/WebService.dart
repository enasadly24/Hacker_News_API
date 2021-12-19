import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:mvvm_hackerapi/Constants/BaseUrl.dart';
import 'package:mvvm_hackerapi/Models/Comment.dart';
import 'package:mvvm_hackerapi/Models/Story.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_viewModel.dart';

final _rootURL = 'https://hacker-news.firebaseio.com/v0';
class WebService{
  Future<Story>_getStory(int storyId)async{
    //final url =" https://hacker-news.firebaseio.com/v0/item/$storyId.json?print=pretty";
  final response=  await http.get(Uri.parse('$_rootURL/item/$storyId.json'));
  if(response.statusCode==200){
     final json=  jsonDecode(response.body);
     return Story.fromJson(json);
  }else{
    throw Exception("Failed to get story");
  }
  }
 Future<List<Story>> getTopStroies() async{
   final response= await  http.get(Uri.parse('$_rootURL//topstories.json'));
     if(response.statusCode==200){
       Iterable storyIds = jsonDecode(response.body);
      /* return Future.wait(storyIds.take(10).map((storyId) {
         return _getStory(storyId);
       }));*/

       return Future.wait(storyIds.map((storyId){
         return _getStory(storyId);
       }));
     } else {
       throw Exception("Unable to fetch data!");
     }
  }

  Future<List<Comment>> getCommentsByStory(Story story) async{
    return Future.wait(story.commentsIds.map((commentId) async{
       final response= await http.get(Uri.parse("$_rootURL/item/$commentId.json"));
       if(response.statusCode==200){
         final Map<String, dynamic> json=jsonDecode(response.body);
         return Comment.fromjson(json);

       }else{
         throw Exception("Unable to get comments");
       }
    }).toList());
  }
}