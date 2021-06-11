import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(this.title,
        style: TextStyle(fontSize: 17)));
  }
}
