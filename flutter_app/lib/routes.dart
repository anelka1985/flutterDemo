import 'package:flutter/material.dart';

void main() {
//  runApp(MaterialApp(
//    initialRoute: '/',
//    routes: {
//      '/': (context) => FirstRoute(),
//      '/second': (context) => SecondRoute()
//    },
//    title: 'navi',
////    home: FirstRoute(),
//  ));
  runApp(MaterialApp(
    routes: {
      '/': (context) => ArguRouteA(),
      ArguRouteB.PAGENAME: (context) => ArguRouteB()
    },
    initialRoute: '/',
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text('firstroute')),
      body: Center(
        child: RaisedButton(
          child: Text('to second'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
//            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),);
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('secondroute'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('back First'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class Argument {
  var title;
  var message;

  Argument(this.title, this.message);
}

var num = 1;

class ArguRouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Argument argument =
//        ModalRoute.of(context).settings.arguments; //ModalRoute.of 这种方式获取参数
    return new Scaffold(
      appBar: AppBar(
        title: Text('准备传参'),
      ),
      body: Center(
//        child: Text(argument.message),
        child: RaisedButton(
          onPressed: () {
            num += 1;
            Navigator.pushNamed(context, ArguRouteB.PAGENAME,
                arguments: Argument("标题$num", '消息$num'));
          },
          child: Text('开始传参'),
        ),
      ),
    );
  }
}

class ArguRouteB extends StatelessWidget {
  static const PAGENAME = '/arguroute';

  @override
  Widget build(BuildContext context) {
    Argument argument =
        ModalRoute.of(context).settings.arguments; //ModalRoute.of 这种方式获取参数
    return new Scaffold(
      appBar: AppBar(
        title: Text(argument.title),
      ),
      body: Center(
//        child: Text(argument.message),
        child: RaisedButton(
          onPressed: () {
            num += 1;
            Navigator.pushNamed(context, PAGENAME,
                arguments: Argument("标题$num", '消息$num'));
          },
          child: Text(argument.message),
        ),
      ),
    );
  }
}
