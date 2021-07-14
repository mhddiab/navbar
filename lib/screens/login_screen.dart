import 'package:final_app/generated/l10n.dart';
import 'package:final_app/moduls/users.dart';
import 'package:final_app/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation sizeAnimation;
  double height = 100;
  String username;
  String passWord;
  List<bool> retry = [];
  bool forgetPassword = false;

  void register() {
    Navigator.pushReplacementNamed(context, RegisterScreen.id);
  }

  void login(String userName, String passWord, BuildContext context) {
    print(retry.length);
    setState(() {
      for (int i = 0; i < Users.users.length; i++) {
        if (Users.users[i].username == userName &&
            Users.users[i].passWord == passWord) {
          print("login");
          retry = [];
          forgetPassword = false;
          return;
        } else {
          print("notlogin");
          if (retry.length == 2) {
            forgetPassword = true;
          }
        }
      }
      retry.add(false);
    });
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  Locale _userlocal;

  @override
  void didChangeDependencies() {
    final newlocale = Localizations.localeOf(context);
    if (newlocale != _userlocal) {
      _userlocal = newlocale;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    sizeAnimation = Tween<double>(begin: 0, end: 100).animate(controller);

    var keyboardVisibilityController = KeyboardVisibilityController();

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool visible) {
      setState() {
        visible ? height = 0 : Fun1();
      }

      controller.isCompleted ? controller.reset() : null;
    });
  }

  bool _hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        body: Column(
          children: [
        Container(
        decoration: BoxDecoration(
        color: Color(0xffF2F5F6),

      ),
          child:Image.asset('assets/wallpaper.jpg',fit: BoxFit.cover,),

        ),
            Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF2F5F6),
              ),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(),
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(20),
                      child: Image.asset('assets/Logo-ousos.png'),
                      height: height,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.10,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'please Enter Your UserName';
                                else
                                  return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  username = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: S.of(context).userName,
                                  focusColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[500]),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x99C41230)),
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.10,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'please Enter Your PassWord';
                                else
                                  return null;
                              },
                              obscureText: _hiddenPassword,
                              onChanged: (value) {
                                setState(() {
                                  passWord = value;
                                });
                              },
                              decoration: InputDecoration(
                                  suffix: GestureDetector(
                                    child: !_hiddenPassword
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Color(0xEEC41230),
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                    onLongPress: () {
                                      setState(() {
                                        _hiddenPassword = false;
                                      });
                                    },
                                    onLongPressEnd: (Long) {
                                      setState(() {
                                        _hiddenPassword = true;
                                      });
                                    },
                                  ),
                                  hintText: S.of(context).Password,
                                  focusColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[500]),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x99C41230)),
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    isKeyboardVisible
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.03),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xEEC41230)),
                                elevation: MaterialStateProperty.all(10),
                              ),
                              onPressed: () {
                                login(username, passWord, context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                      vertical:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                  child: Text(S.of(context).Login)),
                            ),
                          ),
                    forgetPassword && !isKeyboardVisible
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                S.of(context).forgetpassword,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[700],
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'ResetPassword',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xEEC41230),
                                    ),
                                  ))
                            ],
                          )
                        : SizedBox(),
                    !isKeyboardVisible
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                S.of(context).register,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[700],
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    register();
                                  },
                                  child: Text(
                                    S.of(context).registerAccount,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xEEC41230),
                                    ),
                                  )),
                            ],
                          )
                        : SizedBox(),
                  ]),
            ),
          ),
        ]),
      );
    });
  }
}
