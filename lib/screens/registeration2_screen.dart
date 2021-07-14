import 'package:dots_indicator/dots_indicator.dart';
import 'package:final_app/moduls/strongpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Register2Screen extends StatefulWidget {
  static const id = '/register2screen';
  List<String>user = [];
  Register2Screen({this.user});
  @override
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> with SingleTickerProviderStateMixin{
  String password;
  String confirmPassword;
  double height = 100;
  AnimationController controller;
  Animation sizeAnimation;
  bool isStrongPassword = false;
  Color iconColor = Colors.grey;
  Color iconColor2 = Colors.grey;
  Color iconColor3 = Colors.grey;
  Color iconColor4 = Colors.grey;
  GlobalKey _formKey = GlobalKey();
  int strongpasswordkey = 0;
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  Fun1() {
    controller.forward();
    controller.addListener(() {
      setState(() {
        height = sizeAnimation.value;
        print(sizeAnimation.value);
      });
    });
  }
  String Fun2(String value) {
    List<String>patterns = [
      r'^(?=.*?[A-Z])',
        r'(?=.*?[a-z])',
      r'(?=.*?[0-9])',
      r'(?=.*?[!@#\$&*~])',
      r'{8}'
    ];
      for (int i = 0; i < patterns.length; i++) {
        RegExp regex = new RegExp(patterns[i]);
        if (!regex.hasMatch(value) || value == null) {
          i = i;
        } else {
          strongpasswordkey++;
        }
        print(strongpasswordkey);
        // ignore: unrelated_type_equality_checks
        if(strongpasswordkey == 0) {
          setState(() {
            iconColor = Colors.grey;
            iconColor2 = Colors.grey;
            iconColor3 = Colors.grey;
            iconColor4 = Colors.grey;
            return;
          });
        } else if (strongpasswordkey == 1) {
          setState(() {
            iconColor = Color(0xEEC41230);
            iconColor2 = Colors.grey;
            iconColor3 = Colors.grey;
            iconColor4 = Colors.grey;
            return;
          });
        }
        else if (strongpasswordkey == 2) {
          setState(() {

            iconColor = Color(0xEEC41230);
            iconColor2 = Color(0xEEC41230);
            iconColor3 = Colors.grey;
            iconColor4 = Colors.grey;
            return;
          });
        }
        else if (strongpasswordkey == 3) {
          setState(() {
            iconColor = Color(0xEEC41230);
            iconColor2 = Color(0xEEC41230);
            iconColor3 = Color(0xEEC41230);
            iconColor4 = Colors.grey;
            return;
          });
        } else if (strongpasswordkey == 4) {
         setState(() {
           iconColor = Color(0xEEC41230);
           iconColor2 = Color(0xEEC41230);
           iconColor3 = Color(0xEEC41230);
           iconColor4 = Color(0xEEC41230);
           return;
         });
        }

      }
    print(strongpasswordkey);
    print(iconColor);

  }
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 200), vsync: this);
    sizeAnimation = Tween<double>(begin: 0, end: 100).animate(controller);
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Subscribe
    keyboardVisibilityController.onChange.listen((bool visible) {
      visible ? height = 0 : Fun1();
      controller.isCompleted ? controller.reset():null;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/wallpaper.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Row(
                      children: [
                        SizedBox(width: 10,),
                        TextButton(onPressed: (){}, child: Row(children: [Icon(Icons.arrow_back_ios,color: Color(0xEEC41230),),Text('Back', style: TextStyle(color: Color(0xEEC41230),fontSize: 20),)]

                        )),
                      ],
                    ),
                    isKeyboardVisible?Container():Container(
                      child: Image.asset('assets/Logo-ousos.png'),
                      height: height,
                    ),
                   isStrongPassword?StrongPassword(iconColor:iconColor,iconColor2: iconColor2,iconColor3: iconColor3,iconColor4: iconColor4,):Container(),
                    Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.10,
                                  vertical:
                                      MediaQuery.of(context).size.width *
                                          0.02),
                              child: TextFormField(
                                onChanged: (value){
                                    Fun2(value);
                                },
                                //validator:Fun2,
                                onTap: (){
                                  setState(() {
                                    isStrongPassword = true;
                                  });
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.supervised_user_circle),
                                    hintText: 'Password',
                                    focusColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[500]),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x99C41230)),
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.10,
                                  vertical:
                                      MediaQuery.of(context).size.width *
                                          0.02),
                              child: TextFormField(
                                onTap: (){
                                  setState(() {
                                    isStrongPassword = false;
                                  });
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    hintText: 'Confirm Password',
                                    focusColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[500]),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x99C41230)),
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.03),
                              child: ElevatedButton(style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xEEC41230)),
                                elevation: MaterialStateProperty.all(10),
                              ),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, Register2Screen.id);
                                  });
                                },
                                child: Padding(padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.35, vertical: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05), child: Text('Next')),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: isKeyboardVisible?Container():DotsIndicator(
                                dotsCount: 3,
                                position: 1,
                                decorator: DotsDecorator(
                                    spacing: EdgeInsets.all(20),
                                    size: const Size.square(9.0),
                                    activeSize: const Size(18.0, 9.0),
                                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                    activeColor: Color(0xEEC41230),
                                    color: Color(0XEE58595B)
                                ),
                              ),
                            ),

                          ]),
                    ),

                  ])));
    });
  }
}
