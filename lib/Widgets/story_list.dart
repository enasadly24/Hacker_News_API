

import 'package:flutter/material.dart';
import 'package:mvvm_hackerapi/Models/Story.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_viewModel.dart';

class StoryList extends StatelessWidget {
  final List<StoryViewModel> stories;
  final Function(StoryViewModel) onSelected;
  StoryList({this.stories, this.onSelected});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.stories.length,
      itemBuilder: (context, index) {

        final story = this.stories[index];

        return ListTile(
          onTap: (){
            this.onSelected(story);
          },
          title: Text(story.title, style: TextStyle(fontSize: 20)),
              trailing: Container(
                alignment: Alignment.center,
                 width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text("${story.noOfComments}",style: TextStyle(color: Colors.white),)),
        );
      },
    );
  }
}
