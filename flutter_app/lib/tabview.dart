import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabViewWidget extends StatefulWidget  {
  final  String name;

  TabViewWidget({Key key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TabViewState();



}

class TabViewState extends State<TabViewWidget> with AutomaticKeepAliveClientMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var result = 'initstate '+ widget.name ;
    print(result);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    var result = 'dispose '+ widget.name;
    print(result);

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text(widget.name),
//        child: Text(centerTxt),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
