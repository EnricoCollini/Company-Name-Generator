import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute
        .of(context)
        .settings
        .arguments;
    print(data["salvati"].elementAt(1));

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Salvati"),
            centerTitle: true,
          ),
          body: Column(
              children: [
              new Expanded(
                  child: ListView.builder(
                    itemCount: data["salvati"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(data["salvati"].elementAt(index)),
                        trailing: Icon(Icons.delete),
                        onTap: () {
                          _delete(data["salvati"].elementAt(index));
                        },
                      );
                    },),)
                  ]
          ),
        )
    );
  }

  void _delete(valore) {
    setState(() {
      data["salvati"].remove(valore);
    });

  }

  Future<bool> _onBackPressed() async {
    Navigator.pop(context, data);
    return true;
  }
}
