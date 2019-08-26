import 'package:flutter/material.dart';
import 'package:flutter_app/tabview.dart';

void main() {
  runApp(MaterialApp(
    routes: {"/": (context) => _Test()},
    initialRoute: '/',
  ));
}

class _Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State<_Test> {
  final PageController topPageControl = new PageController();
  final List<String> tab = ["动态", "趋势", "我的"];

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(
          onPressed: () {
            topPageControl.jumpTo(MediaQuery.of(context).size.width * i);
          },
          child: new Text(
            tab[i],
            maxLines: 1,
          )));
    }
    return list;
  }

  _renderPage() {
    return [
      new TabViewWidget(name:"aaaaaaa"),
      new TabViewWidget(name:"bbbbbbb"),
      new TabViewWidget(name:"ccccccc"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new _CdqTabWidget(
        type: _CdqTabWidget.BOTTOM_TAB,
        tabItems: _renderTab(),

        ///渲染页面
        tabViews: _renderPage(),
        topPageControl: topPageControl,
        backgroundColor: Colors.black45,
        indicatorColor: Colors.white,
        title: new Text("helloworld"));
  }
}

class _CdqTabWidget extends StatefulWidget {
  static const int BOTTOM_TAB = 1;

  static const int TOP_TAB = 2;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget drawer;

  final Widget floatingActionButton;

  final TarWidgetControl tarWidgetControl;

  final PageController topPageControl;

  const _CdqTabWidget(
      {Key key,
      this.type,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title,
      this.drawer,
      this.floatingActionButton,
      this.tarWidgetControl,
      this.topPageControl})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CdqTabState(type, tabItems, tabViews, backgroundColor,
        indicatorColor, title, drawer, floatingActionButton, topPageControl);
  }
}

class TarWidgetControl {}

class CdqTabState extends State<_CdqTabWidget>
    with SingleTickerProviderStateMixin {
  final int _type;

  final List<Widget> _tabItems;

  final List<Widget> _tabViews;

  final Color _backgroundColor;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final PageController _pageController;

  CdqTabState(
      this._type,
      this._tabItems,
      this._tabViews,
      this._backgroundColor,
      this._indicatorColor,
      this._title,
      this._drawer,
      this._floatingActionButton,
      this._pageController)
      : super();

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      drawer: null,
//      floatingActionButton: null,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('cdq',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold)),
//          bottom: TabBar(
//            tabs: _tabItems,
//            isScrollable: true,
//            indicatorColor: _indicatorColor,
//          )
      ),
      body: PageView(
        controller: _pageController,
        children: _tabViews,
        onPageChanged: (index) => _tabController.animateTo(index),
      ),
      bottomNavigationBar: Material(
        color: _backgroundColor,
        child: TabBar(
          tabs: _tabItems,
          controller: _tabController,
          indicatorColor: _indicatorColor,
        ),
      ),
    );
  }

  @override
  void initState() {
    _tabController = new TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
  }
}
