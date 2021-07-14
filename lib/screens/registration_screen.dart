import 'package:final_app/generated/l10n.dart';
import 'package:final_app/moduls/user.dart';
import 'package:final_app/screens/registeration2_screen.dart';
import 'package:final_app/screens/test.dart';
import 'package:final_app/screens/varificationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RegisterScreen extends StatefulWidget {
  static const id = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>with SingleTickerProviderStateMixin {

  String username;

  String email;
  String name;
  AnimationController controller;
  Animation sizeAnimation;
  double height = 100;
  List<String> user= [];
register({String username,String email,String name}){
  if (_formKey.currentState.validate())
  {
    user = [];
    user.add(username);
    user.add(email);
    user.add(name);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Processing Data')));
    Navigator.pushNamed(context, Register2Screen.id,arguments: user);
  }
  else return  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(duration: Duration(seconds: 1),content: Row(mainAxisAlignment:MainAxisAlignment.center,children:[ Text('Please Enter Your Info Right')])));
}
  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
     if(!regex.hasMatch(value) || value == null)
       return  'Enter a valid email address';
     else
       return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  Fun1() {
    controller.forward();
    controller.addListener(() {
      setState(() {
        height = sizeAnimation.value;
        print(sizeAnimation.value);
      });
    });
  }
    @override
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
        controller.isCompleted ? controller.reset() : null;
      });
    }
    @override
    Widget build(BuildContext context) {
      return KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/wallpaper.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          width: 150,
                          child: Image.asset('assets/Logo-ousos.png'),
                          height: height,),
                        SizedBox(height: 20,),
                        Form(
                          key: _formKey,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.10, vertical: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.02),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return isKeyboardVisible?null :'Enter your Name';
                                  }else{
                                    return null;
                                  }
                                },
                                onChanged: (value){
                                  setState(() {
                                   name = value ;
                                  });
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.account_box),
                                    hintText: 'Name',
                                    focusColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[500]),
                                    ),

                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x99C41230)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.10, vertical: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.02),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return isKeyboardVisible?null :'Enter a UserName';
                                  }else{
                                    return null;
                                  }
                                },
                                onChanged: (value){
                                  setState(() {
                                    username = value ;
                                  });
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.supervised_user_circle),
                                    hintText: 'UserName',
                                    focusColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[500]),
                                    ),

                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x99C41230)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey
                                    )
                                ),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.10, vertical: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.02),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: !isKeyboardVisible?validateEmail:(value){return null;},
                                onChanged: (value){
                                  setState(() {
                                     email = value ;
                                  });
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    hintText: 'Email',
                                    focusColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey[500]),
                                    ),

                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0x99C41230)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey
                                    )
                                ),

                              ),
                            ),

                          ],
                        ),
                        ),
                        isKeyboardVisible?Container():Padding(
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
                              register(username: username,email: email,name: name);
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
                            position: 0,
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


                      ]
                  ),
                ),
              ),
            );
          }
      );
    }
  }

