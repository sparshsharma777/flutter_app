import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/CatalogModel.dart';
import 'package:flutter_app/wdgets/ItemWidget.dart';
import 'package:flutter_app/wdgets/MyThemes.dart';
import 'package:flutter_app/wdgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/Catalog_List.dart';
import 'home_widgets/Catalog_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(
        seconds: 2)); //intentional delay for 2 seconds to show progress bar
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    var decedData = jsonDecode(catalogJson);
    var productsData = decedData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyyList=List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),

            ],
          ),
        ),
      ),
    );
  }

  getListViewBuilder() {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) =>
          ItemWidget(item: CatalogModel.items[index]),
    );
  }

  getOldScafoldWidgets() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              // ? getListViewBuilder()
              ? getGridViewBuilder()
              : CircularProgressIndicator().centered().expand(),

        ),
      ),
      drawer: MyDrawer(),
    );
  }

  getGridViewBuilder() {
    return GridView.builder(
      itemCount: CatalogModel.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
      itemBuilder: (context, index) {
        final item = CatalogModel.items[index];

        return Card(
          elevation: 5.0,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: GridTile(
            header: Container(
              child: Text(
                item.name,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            child: Image.network(item.image),
            footer: Container(
              child: Text(
                item.price.toString(),
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}







