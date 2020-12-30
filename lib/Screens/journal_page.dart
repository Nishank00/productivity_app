import 'package:flutter/material.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      color: Colors.red,
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10.0),
                    height: 150,
                    width: 150,
                    child: Icon(Icons.add))
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10.0),
                    height: 150,
                    width: 150,
                  );
          }),
    );
  }
}
