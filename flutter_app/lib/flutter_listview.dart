import 'package:flutter/material.dart';
//https://juejin.im/post/5b685a2a5188251ac22b71c0

class CdqListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CdqListState();
  }
}

ScrollController _scrollController;

class CdqListState extends State<CdqListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
        key: null,
        onRefresh: null,
        child: new ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),

          ///根据状态返回子孔健
          itemBuilder: (context, index) {
            return _getItem(index);
          },

          ///根据状态返回数量
          itemCount: _getListCount(),

          ///滑动监听
          controller: _scrollController,
        ));
  }

  _getListCount() {}

  _getItem(int index) {
    return null;
  }

  ///空页面
  Widget _buildEmpty() {
    ///···
  }

  ///上拉加载更多
  Widget _buildProgressIndicator() {
    ///···
  }
}
