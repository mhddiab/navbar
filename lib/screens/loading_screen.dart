import 'dart:async';
import 'dart:io';

import 'package:final_app/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatefulWidget {

  static const id = '/';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

ToLogin()async{
  await Future.delayed(Duration(seconds: 2));
  Navigator.pushReplacementNamed(context, LoginScreen.id);
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToLogin();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                  child: Hero( tag:'log',child: Image.asset('assets/Logo-ousos.png'),)) ,
          SizedBox(height: 20,),
          ConstrainedBox(
          constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height/8,
        ),
        child: LoadingIndicator(
          color: Color(0x99C41230),
          indicatorType: Indicator.ballRotateChase,
        ),
          ),

            ],
          )
          )
          ),
    );
  }
}

