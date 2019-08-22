import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class GesturedetectorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GesturedetectorState();
  }
}

class GesturedetectorState extends State<GesturedetectorWidget> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            isTap ? "taped" : "notap",
            style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: isTap ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }

  void onTap() {
    setState(() {
      isTap = !isTap;
    });
  }
}

void main() {
  runApp(MaterialApp(
      title: 'Flutter cn gesturedetector',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: ParentWidget(),
        ),
      )));
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget> {
  bool isTap = false;

  void onTapEvent(bool istap) {
    setState(() {
      isTap = istap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapCbox(
        active: isTap,
        onChanged: onTapEvent,
      ),
    );
  }
}

class TapBbox extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBbox({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void ontap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'ACTIVE' : 'INACTIVE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapCbox extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  TapCbox({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  TapCboxState createState() => TapCboxState();
}

class TapCboxState extends State<TapCbox> {
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapUp: _handleTapUp,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'ACTIVE' : 'INACTIVE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
              : null,
        ),
      ),
    );
  }
}
