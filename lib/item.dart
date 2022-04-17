import 'package:flutter/material.dart';

void main() => runApp(Item());

class Item extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO LIST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: TextFieldAlertDialog(),
    );
  }
}
class TextFieldAlertDialog extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ADD HERE'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Eg.: Groceries"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:Text('TO DO LIST'),
        backgroundColor: Colors.red,
        centerTitle: true,

      ),

      floatingActionButton: FloatingActionButton(
        child: Text(
          '+',
          style: TextStyle(fontSize: 20.0),),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
        ),
        backgroundColor: Colors.red,
        onPressed: () => _displayDialog(context),
      ),
    );
  }
}

