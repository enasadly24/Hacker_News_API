

import 'package:mvvm_hackerapi/Models/Comment.dart';

class CommentViewModel{

  final Comment comment;

  CommentViewModel({this.comment});

  String get title{
    return this.comment.title;
  }
  int get commentId{
    return this.comment.commentId;
  }
}