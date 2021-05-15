import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
      ),
      body: Container(
        child: Text("Welcome to 30 days flutter course"),
      ), 
      drawer: Drawer(),
    );
  }
}
