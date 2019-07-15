import 'package:flutter/material.dart';
import 'item.dart';

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: 'listview',
      backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('listview'),
      ),
      body: new ListView.builder(
          itemBuilder: (context, index) {
            return new ListItem();
          },
          itemCount: 20),
    );
  }
}

void main() {
  runApp(new MaterialApp(home: new ListDemo()));
}
