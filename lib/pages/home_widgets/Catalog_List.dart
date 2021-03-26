
import 'package:flutter/material.dart';
import 'package:flutter_app/models/CatalogModel.dart';
import 'package:flutter_app/pages/home_details/Home_Details_Page.dart';
import 'package:flutter_app/wdgets/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Catalog_Image.dart';


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final item = CatalogModel.items[index];
          return InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:( context)=>HomePageDetails(item:item))),
            child: CatalogItem(
              catalog: item,
            ),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key key, @required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),

                child: CatalogImage(image:catalog.image)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  catalog.name.text.lg.color(MyThemes.darkBlueColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
                        style: ButtonStyle(

                            backgroundColor: MaterialStateProperty.all(MyThemes.darkBlueColor),
                            shape: MaterialStateProperty.all(StadiumBorder())
                        ),

                      )
                    ],
                  ).pOnly(right: 8.0)

                ],
              ),
            )
          ],

        )
    ).white.rounded .square(120).make().py16();
  }
}