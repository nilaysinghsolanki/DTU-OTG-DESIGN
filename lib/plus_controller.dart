import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class PlusAnimation extends SimpleAnimation {
  PlusAnimation(String animationName) : super(animationName);



  start() {
    isActive=true;

     instance.animation.loop=Loop.oneShot;

     instance.direction=1;
    //instance!.animation.duration=10;
    //instance!.animation.workStart=0;

    print("pressed start");











  }

  reverse(){
    print("pressed reverse");
    isActive=true;


    instance.animation.loop=Loop.oneShot;


    //instance!.animation.workStart=60;





    instance.direction=-1;


  }






}