import 'package:flutter/material.dart';
import 'package:flutter_app/models/CatalogModel.dart';

class ItemWidget extends StatelessWidget{

  final Item item;

  const ItemWidget({Key key, @required this.item}) : assert(item!=null) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        onTap: (){
          print("Pressed ${item.name}");
        },
        leading: Image.network(item.image),
        title: Text(item.desc),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",style: TextStyle(color:Colors.deepPurple,fontWeight: FontWeight.bold),textScaleFactor: 1.2,),
      ),
    );
  }

}