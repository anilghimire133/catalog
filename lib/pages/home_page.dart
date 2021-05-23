import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:http/http.dart' as https;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cart = (VxState.store as MyStore).cart;

  final url = "https://api.jsonbin.io/b/60a9e76eb2b1d74df21b2aa3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await https.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.gray200,
            size: 20,
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogeHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
