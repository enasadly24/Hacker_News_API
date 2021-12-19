
// making request to webs services functions maping to viewnodel and return to ui

import 'package:flutter/material.dart';

import 'package:mvvm_hackerapi/Services/WebService.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_viewModel.dart';

class StoryListViewModel extends ChangeNotifier{
  List<StoryViewModel> stories = List<StoryViewModel>();
  Future<void> getTopStories() async{
    final Iterable results= await WebService().getTopStroies();
    this.stories = results.map((story) => StoryViewModel(story: story)).toList();
    notifyListeners();
  }
}