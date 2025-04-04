import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColor extends StatefulWidget {
  
  const ChangeColor({super.key});

@override
  State<ChangeColor> createState() {
    return _ChangeColorState();
  }
}
class _ChangeColorState extends State<ChangeColor> {
  var initialColor = Color.fromARGB(255,69, 100, 41)  ;
  void ChangeColor(){
 setState(() {
   initialColor = Color.fromARGB(255, 
   Random().nextInt(256),
   Random().nextInt(256),
   Random().nextInt(256));
 });
  }

   Alignment initialDirection = Alignment.topCenter;
  int directionIndex = 0;

  void changeDirection() {
    setState(() {
  List<Alignment> directions = [
    Alignment.topCenter,       
    Alignment.centerLeft,      
    Alignment.topLeft,       
    Alignment.topRight,   
  ];

      directionIndex = (directionIndex + 1) % directions.length;
      initialDirection = directions[directionIndex];
    });
  }
  @override
  Widget build(BuildContext context) {
   return  Center(
     child: Container(
      
            decoration: BoxDecoration(
             gradient: LinearGradient(
              colors: [initialColor, Colors.white],
              begin: initialDirection,
              end: Alignment(-initialDirection.x, -initialDirection.y),
              ),


            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton( style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.white), padding: EdgeInsets.symmetric(horizontal: 35, vertical: 14), )  , onPressed: ChangeColor, child: Text('Change Color', style: TextStyle(color:Color.fromARGB(255, 112, 106, 106) , fontSize: 15),)),
                  ),
              SizedBox(height: 20),
              Text(
              ' Red ${initialColor.red}, Green ${initialColor.green},Blue ${initialColor.blue}',
              style: TextStyle(color: Colors.black, fontSize: 20),

              ),
              SizedBox(height: 20),
              ElevatedButton( style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.white) )  ,onPressed: changeDirection, child: Text('Change Direction', style: TextStyle(color:Color.fromARGB(255, 112, 106, 106) , fontSize: 15),)),
               SizedBox(height: 20),
              Text(
              ' Direction: ${initialDirection}',
              style: TextStyle(color: Colors.black, fontSize: 20),

              ),
              ],
              
            ),
         
          ),

   );
  }

}