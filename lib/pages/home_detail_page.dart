import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.red800.xl4.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to cart".text.make(),
            ).wh(120, 50)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h40(context),
            ),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Theme.of(context).cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold
                        .color(context.accentColor)
                        .make()
                        .py20(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Fugiat labore sunt epteur veniam. Excepteur consequat esse sunt amet irure duis nulla do."
                        .text
                        .make()
                        .p12()
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
