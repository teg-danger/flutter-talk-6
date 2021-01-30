


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class GlobalState extends ChangeNotifier {
  int count=0;
  int index = 0;
  bool showNavigation=true;
  int randomValue =0;

  ScrollController _controller;

  bool loading=false;

  void increment(){
    count++;
    notifyListeners();
  }

  void changePage(int page){
    index = page;
    notifyListeners();
  }

  Future generateValue()async{
    loading = true;
    notifyListeners();
    
    await Future.delayed(Duration(seconds: 1));

    randomValue = Random().nextInt(15000);
    loading = false;
    notifyListeners();
  }

  void listenScroller(ScrollController controller){
    if(_controller == controller) return;
    _controller = controller;
    controller.addListener(() {
      if(_controller.position.userScrollDirection == ScrollDirection.reverse){
        showNavigation = false;
      }else{
        showNavigation = true;
      }
      notifyListeners();
    });
    
  }
}