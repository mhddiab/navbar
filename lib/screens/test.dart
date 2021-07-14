import 'package:flutter/material.dart';


class TestForm extends StatefulWidget {
  Widget child;
  TestForm({this.child});
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
     child: widget.child,
    );
  }
}
