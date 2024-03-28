import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({ Key? key }) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView,
    );
  }

  Widget get _buildPageView {
    return PageView(
      pageSnapping: true,
      children: const [],

    );
  }

  // Widget _buildStory() {
  //   return PageView.builder(itemBuilder: itemBuilder)
  // }
}