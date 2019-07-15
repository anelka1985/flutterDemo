import 'package:flutter/material.dart';


class Third_SubLayout extends StatelessWidget {
  String title;

  IconData icon;

  Third_SubLayout(this.title, this.icon);

  //Expanded(child: null)
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue[500],
          ),
          new Padding(padding: const EdgeInsets.all(5)),
          Text(title, style: TextStyle(color: Colors.black, fontSize: 12))
        ],
      ),
    );
  }
}


Widget secondLayout2 = Container(
    child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Oeschinen Lake Campground',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  decoration: TextDecoration.none)),
          new Padding(padding: const EdgeInsets.all(10)),
          Text('Kandersteg, Switzerland',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  decoration: TextDecoration.none)),
        ],
      ),
    ),
    StarWidget()
  ],
));
Widget secondLayout = Row(
  children: <Widget>[
    Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(padding: const EdgeInsets.all(10)),

        Text('Oeschinen Lake Campground',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                decoration: TextDecoration.none)),
        Padding(padding: const EdgeInsets.all(10)),
        Text('Kandersteg, Switzerland',
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                decoration: TextDecoration.none)),
        new Padding(padding: const EdgeInsets.all(10)),

      ],
    )),
    StarWidget()
//      Icon(
//        Icons.star,
//        color: Colors.red[500],
//      ),
//      Text('41', style: TextStyle(color: Colors.black, fontSize: 12))
  ],
);

Widget thirdLayout = Card(
    color: Colors.white,
    child: new Container(
      padding: const EdgeInsets.all(10),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        new Third_SubLayout('CALL', Icons.call),
        new Third_SubLayout('ROUTE', Icons.near_me),
        new Third_SubLayout('SHARE', Icons.share),
      ]),
    ));

Widget fourthLayout = Container(
  padding: EdgeInsets.all(10),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    style: TextStyle(
        color: Colors.black, fontSize: 12, decoration: TextDecoration.none),
    softWrap: true,
  ),
);

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(32),
            child: ListView(
              children: <Widget>[
                Image.asset(
                  'images/lake.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: <Widget>[secondLayout, thirdLayout, fourthLayout],
                ),
              ],
            )));
  }
}

class StarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StarState();
  }
//  StarState createState() => StarState();
}

class StarState extends State<StarWidget> {
  bool stared = true;
  int value = 30;

  void updateWidget() {
    setState(() {
      if (stared) {
        stared = false;
        value -= 1;
      } else {
        stared = true;
        value += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: (stared ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: updateWidget,
          ),
        ),
        Container(
          child: Text('$value'),
        ),
      ],
    );
  }
}

class FlexStarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Flutter layout demo'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ]),
          ),
//          FavoriteWidget()
          StarWidget()
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(title: 'Flutter layout demo', home: FlexLayout()));
}
