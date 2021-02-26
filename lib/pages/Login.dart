import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool _channgedButton = false;
  final _formKey=GlobalKey<FormState>();



  moveToLogin(BuildContext context)async {
    if(_formKey.currentState.validate())
    {
      setState(() {
        _channgedButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyAppRoutes.homeRoute);
      setState(() {
        _channgedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter user name", labelText: "Login"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator:(value){
                        if(value.isEmpty){
                          return "User Name can not be empty";
                        }

                        return  null;
                        },
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter password", labelText: "Password"),
                        validator:(value){
                          if(value.isEmpty){
                            return "Password can not be empty";
                          }
                          else if(value.length<7){
                             return "Password can not be less then 7 digits";
                          }
                          return  null;
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Colors.deepPurple,
                       borderRadius: BorderRadius.circular(_channgedButton ? 50 : 8),
                      child: InkWell(
                        onTap: ()=>moveToLogin(context),
                        child: AnimatedContainer(
                          width: _channgedButton ? 50 : 140,
                          height: 50,
                          duration: Duration(seconds: 1),
                          alignment: Alignment.center,
                          child: _channgedButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
