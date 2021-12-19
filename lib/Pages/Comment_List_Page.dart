
import 'package:flutter/material.dart';
import 'package:mvvm_hackerapi/ViewModels/Comment_List_viewModel.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_viewModel.dart';
import 'package:mvvm_hackerapi/Widgets/comment_list_widget.dart';
import 'package:provider/provider.dart';


class CommentListPage extends StatefulWidget {
  final StoryViewModel story;
  CommentListPage({this.story});
  @override
  _CommentListPageState createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CommentListViewModel>(context,listen: false).getCommentsByStory(this.widget.story);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.story.title),
      ),
      body:CommentList(comments: vm.comments)
    );
  }
}

/*
class CommentListPage extends StatelessWidget {
  final StoryViewModel story;
  CommentListPage({this.story});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.story.title),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, index){
          return ListTile(
            title: Text("comment$index"),
          );
          }),
    );
  }
}
*/
