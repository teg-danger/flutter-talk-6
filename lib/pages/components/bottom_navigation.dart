import 'package:flutter/material.dart';
import 'package:talk/states/global_state.dart';
import 'package:provider/provider.dart';

class BottonNavigation extends StatefulWidget {
  final Function(int index) onSelect;
  BottonNavigation({
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _BottonNavigationState createState() => _BottonNavigationState();
}

class _BottonNavigationState extends State<BottonNavigation> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var state = context.watch<GlobalState>();
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 400),
      child: Container(
        height: state.showNavigation ? 60 :0,
        
        child: BottomNavigationBar(
          currentIndex:  state.index,
          onTap: (index){
           state.changePage(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
