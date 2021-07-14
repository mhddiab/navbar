import 'package:flutter/material.dart';

class VarificationScreen extends StatefulWidget {
  static const id = '/varification';
  List<String> user;
  VarificationScreen({this.user});
  @override
  _VarificationScreenState createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

