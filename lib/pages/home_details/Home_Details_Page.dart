import 'package:flutter/material.dart';
import 'package:flutter_app/models/CatalogModel.dart';
import 'package:flutter_app/wdgets/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';


class HomePageDetails extends StatelessWidget{
  final Item item;
  const HomePageDetails({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name),),
     backgroundColor: MyThemes.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${item.price}".text.bold.xl4.green500.make(),
            ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
              style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all(MyThemes.darkBlueColor),
                  shape: MaterialStateProperty.all(StadiumBorder())
              ),

            ).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: Key(item.id.toString()),
                child: Image.network(item.image)).p16().h32(context),

            Expanded(child: VxArc(
              height: 20.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,

              child: Container(

                width: context.screenWidth,
                color: Colors.white,
                child: Column(

                  children: [

                   item.name.toString().text.xl4.color(MyThemes.darkBlueColor).bold.make(),
                    item.desc.text.xl.textStyle(context.captionStyle).make(),
                  ],
                ).py64(),

              ),

            ))
          ],
        )
        ,


      ),


    );
  }
 

}