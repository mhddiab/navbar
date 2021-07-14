import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StrongPassword extends StatelessWidget {
  Color iconColor = Colors.grey;
  Color iconColor2 = Colors.grey;
  Color iconColor3 = Colors.grey;
  Color iconColor4 = Colors.grey;
  StrongPassword({this.iconColor,this.iconColor2,this.iconColor3,this.iconColor4});
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0,horizontal: MediaQuery.of(context).size.width*0.20),
      child: Stack(
        children: [
           Positioned(

             child: Container(
               height: MediaQuery.of(context).size.width*0.05,
               child: Divider(
                  height: 2,
                  thickness: 2,
                  color: Colors.grey,
                ),
             ),
           ),


                      Positioned(
                        top: 0,
                        child: Container(
                        height: MediaQuery.of(context).size.width*0.05,
                        width: MediaQuery.of(context).size.width*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: iconColor,
                        ),
                    ),
                      ),

                      Positioned(
                        left: MediaQuery.of(context).size.width*0.18,

                        child: Container(
                          height: MediaQuery.of(context).size.width*0.05,
                          width: MediaQuery.of(context).size.width*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: iconColor2,
                          ),
                        ),
                      ),

                      Positioned(
                        left: MediaQuery.of(context).size.width*0.38,

                        child: Container(
                          height: MediaQuery.of(context).size.width*0.05,
                          width: MediaQuery.of(context).size.width*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: iconColor3,
                          ),

                        ),
                      ),

                      Positioned(
                        left: MediaQuery.of(context).size.width*0.55,

                        child: Container(
                          height: MediaQuery.of(context).size.width*0.05,
                          width: MediaQuery.of(context).size.width*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: iconColor4,
                          ),
                        ),
                      ),




      ]),
    );
  }
}
