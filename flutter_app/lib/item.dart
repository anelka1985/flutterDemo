import 'package:flutter/material.dart';

_getBottomItem(IconData icon, String text) {
  return new Expanded(
      child: new Center(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///一个图标，大小16.0，灰色
        new Icon(
          icon,
          size: 16.0,
          color: Colors.grey,
        ),

        ///间隔
        new Padding(padding: new EdgeInsets.only(left: 5.0)),

        ///显示文本
        new Text(
          text,
          //设置字体样式：颜色灰色，字体大小14.0
          style: new TextStyle(color: Colors.grey, fontSize: 14.0),
          //超过的省略为...显示
          overflow: TextOverflow.ellipsis,
          //最长一行
          maxLines: 1,
        ),
      ],
    ),
  ));
}

//class ListItem extends State<ListItemWidget> {
//  String text;
//
//  ListItem(this.text);
//
//  @override
//  void initState() {
//    ///初始化，这个函数在生命周期中只调用一次
//    super.initState();
//
//    ///定时2秒
//    new Future.delayed(const Duration(seconds: 5), () {
//      setState(() {
//        text = '这就变了数值';
//      });
//    });
//  }
//
//  @override
//  void dispose() {
//    ///销毁
//    super.dispose();
//  }
//
//  @override
//  void didChangeDependencies() {
//    ///在initState之后调 Called when a dependency of this [State] object changes.
//    super.didChangeDependencies();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Text(
//        text ?? '这就是有状态DMEO',
//        textDirection: TextDirection.ltr,
//      ),
//    );
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    return null;
//  }
//}

//class ListItemWidget extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return new ListItem();
//  }
//}

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      ///卡片包装
      child: new Card(

          ///增加点击效果
          child: new FlatButton(
              onPressed: () {
                print("点击了哦");
              },
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    new Container(
                        child:

                        new Text(
                          "这是一点描述",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14.0,
                          ),

                          ///最长三行，超过 ... 显示
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.center),
                    new Padding(padding: EdgeInsets.all(10.0)),

                    ///三个平均分配的横向图标文字
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getBottomItem(Icons.star, "1000"),
                        _getBottomItem(Icons.link, "1000"),
                        _getBottomItem(Icons.subject, "1000"),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
