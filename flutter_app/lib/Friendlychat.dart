import 'package:flutter/material.dart';

///这个文件，做了一个简单的聊天页面，包含一个输入框，textfiled，监听输入，TextEditingController之类的
/// 一个 listview 列表，用了reverse 由下向上展示聊天记录
/// 对话框加上了动效，TickerProviderStateMixin。SizeTransition包装了要做动效的widget
final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);
void main() => runApp(
      new MaterialApp(title: 'helloworld', home: ChatScreen(),theme: kDefaultTheme,),
    );

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textEditingController =
      new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  bool _isCompose = false;

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('helloworld'))
      ,
      body: _buildTextComposer(),
    );
  }

  _handSubmit() {
    _textEditingController.clear();

    setState(() {
      print(">>>>>>>>>>>>>>>_handSubmit");
      _isCompose = false;
    });
  }

  _sendMessage(String text) {
    print(">>>>>>>>>>>>>>>_sendMessage");
    _textEditingController.clear();
    ChatMessage chatMessage = ChatMessage(
        text: text,
        animationController: AnimationController(
            vsync: this, duration: new Duration(milliseconds: 700)));
    setState(() {
      _messages.insert(0, chatMessage);
    });
    chatMessage.animationController.forward();
  }

//  _bulidRow(context, i) {
//    return Row(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        new Container(
//          margin: const EdgeInsets.only(right: 16.0),
//          child: new CircleAvatar(child: new Text('aaa')),
//        ),
//        Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            new Text('aaa', style: Theme.of(context).textTheme.subhead),
//            new Container(
//              margin: const EdgeInsets.only(top: 5.0),
//              child: new Text(_messages[i]),
//            ),
//          ],
//        ),
//      ],
//    );
//  }

  Widget _buildTextComposer() {
    return Column(
      children: <Widget>[
        Flexible(
            child: ListView.builder(
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
          reverse: true,
        )),
        new Divider(height: 1.0),
        Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                  child: TextField(
                    controller: _textEditingController,
                    onSubmitted: _handSubmit(),
                    onChanged: (String text) =>/* _isCompose = text.length > 0*/_onChange(text),
                    decoration: InputDecoration(hintText: '请输入文案'),
                  ),
                ),
                Container(
                    child: new IconButton(
                  icon: new Icon(Icons.send,),
                  onPressed: () => _isCompose
                      ? _sendMessage(_textEditingController.text)
                      : null,

                ))
              ],
            ))
      ],
    );
  }

  _onChange(String str) {
    _isCompose = str.length > 0 ? true : false;
//    setState(() {
//
//
//      print(">>>>>>>>>>>>>>>_onChange $_isCompose");
//    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController}); //modified

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(10.0),
              child: new CircleAvatar(child: new Text('aaa')),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('aaa', style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ));
  }
}
