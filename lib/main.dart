import 'package:flutter/material.dart';
import 'package:mvvm_hackerapi/Pages/Home_Page.dart';
import 'package:mvvm_hackerapi/ViewModels/Story_List_ViewMOdel.dart';
import 'package:provider/provider.dart';
void main()=>runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hacker News",
      home:   ChangeNotifierProvider(
        create: (context) => StoryListViewModel(),
        child: HomePage(),
      )
    );
  }
}
