import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CatalogApp")),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to 30 days flutter course"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
