import 'package:flutter/material.dart';
import 'package:mvvm_hackerapi/Pages/Comment_List_Page.dart';
import 'package:mvvm_hackerapi/ViewModels/Comment_List_viewModel.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_List_ViewMOdel.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_viewModel.dart';
import 'package:mvvm_hackerapi/Widgets/story_list.dart';
import 'package:provider/provider.dart';

/*
class HomePage extends StatelessWidget {
   HomePage(){
  StoryListViewModel().getTopStories().then((list) {
    debugPrint("$list");
  } );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Hacker News"),
     ),
      body: Text("Top Stories will go here..."),
      
    );
  }
}
*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryListViewModel>(context, listen: false).getTopStories();
  }
  void _navigateToCommentsPage(BuildContext context, StoryViewModel story){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>
         ChangeNotifierProvider(
           create: (context)=>CommentListViewModel(),
           child: CommentListPage(story: story),
         )
     ));
  }
  @override
  Widget build(BuildContext context) {
    /*final vm = Provider.of<StoryListViewModel>(context);
    debugPrint("${vm.stories.length}");*/

    return Scaffold(
        appBar: AppBar(title: Text("Hacker News")),
        body: Consumer<StoryListViewModel>(
          builder: (context, vm, child) {
            return StoryList(
                stories: vm.stories, onSelected: (StoryViewModel story) {
                  _navigateToCommentsPage(context, story);
            });
          },
        ));
  }
}
