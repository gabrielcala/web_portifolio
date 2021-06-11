import 'dart:js';

import 'package:estudoweb/content_view.dart';
import 'package:estudoweb/custom_tab.dart';
import 'package:estudoweb/custom_tab_bar.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  double screenHeight;
  double topPadding;
  double bottomPadding;


  TabController tabController;

  List<ContentView> contentViews = [
    ContentView(tab: CustomTab(title: 'Home',), content: Center(
      child: Column(
        children: [
          Text('Teste')
        ],
      ),
    )),
    ContentView(tab: CustomTab(title: 'About',), content: Center(
      child: Container(color: Colors.blue, width: 100, height: 100,),
    )),
    ContentView(tab: CustomTab(title: 'Projects',), content: Center(
      child: Container(color: Colors.red, width: 100, height: 100,),
    ))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.01;
    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715) {
            return desktopView();
          } else {
            return mobileView();
          }
        },),
      ),
    );
  }


  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTabBar(
            controller: tabController,
            tabs: contentViews.map((e) => e.tab).toList() ),
        Container(
          height: screenHeight*0.85,
            child: TabBarView(
              controller: tabController,
                children: contentViews.map((e) => e.content).toList(),
            ),
        )

      ],
    );
  }


  Widget mobileView() {
    return Container();
  }
}