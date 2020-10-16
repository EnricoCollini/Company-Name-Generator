import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<String> _suggestions = <String>[
    "",
    "",
    "",
  ];
  var _saved = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new RaisedButton(
          onPressed: _updateSuggestions,
          child: Text('Get Suggestions', style: TextStyle(fontSize: 20)),
        ),
        new Expanded(child: _buildSuggestions()),
        new FlatButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/saved', arguments: {
              "salvati": _saved,
            }).then((value) => {
              _aggiorna(value)
            });
          },
          icon: Icon(Icons.add_shopping_cart),
          label: Text("vedi salvate"),)

        //new Container(
        //child: _buildSuggestions(),
        //),
      ],
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final alreadySaved = _saved.contains(_suggestions[index]);
        return ListTile(
          title: Text(_suggestions[index]),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: () {
            _salva(alreadySaved, _suggestions[index]);
          },
        );
      },
    );
  }

  void _updateSuggestions() {
    setState(() {
      _suggestions = [
        WordPair.random().asString,
        WordPair.random().asString,
        WordPair.random().asString,
      ];
    });
  }

  void _salva(salvata, parola) {
    setState(() {
      if (salvata) {
        _saved.remove(parola);
      } else {
        _saved.add(parola);
      }
    });
  }

  void _aggiorna(valori){
    setState(() {
      _saved = Set<String>();
      print(valori["salvati"].length);
      for (int i = 0; i<valori["salvati"].length;i++){
        _saved.add(valori["salvati"].elementAt(i));
      }
    });
  }
}
