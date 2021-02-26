import 'package:flutter/material.dart';
import 'package:flutter_app/models/CatalogModel.dart';
import 'package:flutter_app/wdgets/ItemWidget.dart';
import 'package:flutter_app/wdgets/drawer.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final dummyyList=List.generate(20, (index) => CatalogModel.items[0]);
    
    return Scaffold(
     appBar: AppBar(

       title: Text("Catalog App",),
     ),
      body: Center(

        child: Padding(
          padding: EdgeInsets.all(16.0),

            child: ListView.builder(
              itemCount: dummyyList.length,

                itemBuilder: (context,index){
                  return ItemWidget(item: dummyyList[index]);

            }),

        ),

      ),
      drawer: MyDrawer(),

    );
  }
}
