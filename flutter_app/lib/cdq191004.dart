import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(
      MaterialApp(routes: {
        '/': (context) => MineStateLess(),
        FavratePage.PAGENAME: (context) => FavratePage()
      }, initialRoute: '/'),
    );

class MineStateLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to cdq'),
        ),
        body: MineWidget());
  }
}

class MineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListSelectState();
  }
}

class ListSelectState extends State<MineWidget> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final favs = <WordPair>[];

  _onPress(WordPair pair) {
    setState(() {
      if (favs.contains(pair)) {
        favs.remove(pair);
      } else {
        favs.add(pair);
      }
    });
  }

  _onClick() {
//    Navigator.pushNamed(context,FavratePage.PAGENAME,arguments:favs);
    ModalRoute
        .of(context)
        .navigator
        .pushNamed(FavratePage.PAGENAME, arguments: favs);
  }

  _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();
          /*2*/

          print("==>$i");
          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = favs.contains(pair);
    return Row(
      children: <Widget>[
        GestureDetector(
            onTap: () => _onClick(),
            child: Text(pair.asPascalCase, style: _biggerFont)),
        GestureDetector(
          onTap: () => _onPress(pair),
          child: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildSuggestions(),
    );
  }
}

class FavratePage extends StatelessWidget {
  static const PAGENAME = 'fav';
  var _favarray = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    _favarray = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
        appBar: AppBar(title: Text('welcome subpage')),
        body: ListView.builder(
          itemBuilder: (context, i) {
            return
              Column(children: <Widget>[Row(
                  children: <Widget>[Text(_favarray[i].asString)
                  ]), Divider()
              ]);
          },
          itemCount: _favarray.length,
        )


    );
  }
}


