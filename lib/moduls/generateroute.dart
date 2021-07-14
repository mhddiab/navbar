import 'package:final_app/screens/loading_screen.dart';
import 'package:final_app/screens/login_screen.dart';
import 'package:final_app/screens/mainscreen.dart';
import 'package:final_app/screens/registeration2_screen.dart';
import 'package:final_app/screens/registration_screen.dart';
import 'package:final_app/screens/resetpassword.dart';
import 'package:final_app/screens/varificationscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OngenerateRoute{
  static Route<dynamic> GenerateRoute(RouteSettings settings){
    var args = settings.arguments;
    switch(settings.name){
      case'/':
        return MaterialPageRoute(builder: (context)=> LoadingScreen());
        case'/login':
          return MaterialPageRoute(builder: (context)=> LoginScreen());
      case'/register':
        return MaterialPageRoute(builder: (context)=> RegisterScreen());
      case'/varification':
        return MaterialPageRoute(builder: (context)=> VarificationScreen(user: args,));
      case'/resetpassword':
        return MaterialPageRoute(builder: (context)=> ResetPasswordScreen());
      case'/mainscreen':
        return MaterialPageRoute(builder: (context)=> MainScreen());
      case'/register2screen':
        return MaterialPageRoute(builder: (context)=> Register2Screen(user: args,));
    }
  }
}