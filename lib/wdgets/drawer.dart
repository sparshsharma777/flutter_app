import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String _url =
      "http://4.bp.blogspot.com/_EAViqbzwc_s/TSGfCmQviSI/AAAAAAAADyA/gC1OjkQhTVc/s1600/valentines+day+flowers+%252810%2529.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.zero,
        color: Colors.deepPurple,
        child: ListView(


          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration:BoxDecoration(
                  color: Colors.transparent
                ),


                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    "Sparsh Sharma",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    "sparsh@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(_url),
                  ),
                )),
            ListTile(


              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(

                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),

            ),
            ListTile(

              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),


            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),

            )
          ],
        ),
      ),
    );
  }
}
