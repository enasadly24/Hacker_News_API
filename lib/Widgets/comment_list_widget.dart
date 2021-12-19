
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mvvm_hackerapi/ViewModels/Comment_ViewMOdel.dart';
import 'package:html_unescape/html_unescape.dart';
class CommentList extends StatelessWidget {
  final List<CommentViewModel>comments;
  final unescape = new HtmlUnescape();
CommentList({this.comments});
String _formateCommentText(String text){
  final formattedtText = unescape.convert(text??"");
  return formattedtText.isNotEmpty?formattedtText.substring(0,min(200,formattedtText.length)):"";
}
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.comments.length,
        itemBuilder: (context, index){
          final comment= this.comments[index];
          return ListTile(
            leading: Container(alignment:Alignment.center,
              width: 25,
                height: 25,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.pink,
               ),
                child: Text("${index+1}",style: TextStyle(color: Colors.white),)),
            title: Text(_formateCommentText(comment.title)),
          );
        });
  }
}
