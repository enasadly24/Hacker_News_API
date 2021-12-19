

import 'package:flutter/cupertino.dart';
import 'package:mvvm_hackerapi/Services/WebService.dart';
import 'package:mvvm_hackerapi/ViewModels/Comment_ViewMOdel.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_viewModel.dart';

class CommentListViewModel extends ChangeNotifier{
  List<CommentViewModel> comments = List<CommentViewModel>();

  // funtion responsible for fetching comments by id

  void getCommentsByStory(StoryViewModel storyVM) async{
   final results=await WebService().getCommentsByStory(storyVM.story);
   this.comments= results.map((item) => CommentViewModel(comment: item)).toList();
   notifyListeners();
}
}