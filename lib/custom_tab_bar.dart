import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {

  CustomTabBar({@required this.controller, @required this.tabs});

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth*0.25,
      child: TabBar(controller: controller, tabs: tabs),
    );
  }
}
