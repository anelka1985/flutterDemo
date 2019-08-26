import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabViewWidget extends StatefulWidget {
  final  String name;

  TabViewWidget({Key key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TabViewState();

}

class TabViewState extends State<TabViewWidget> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text(widget.name),
//        child: Text(centerTxt),
      ),
    );
  }
}
