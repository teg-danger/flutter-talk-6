

import 'package:flutter/material.dart';
import 'package:talk/states/global_state.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    context.read<GlobalState>().listenScroller(_controller);
    return Container(
      child: ListView.builder(
        controller: _controller,
        itemCount:1000,
        itemBuilder:(context, index) => ListTile(title:Text("Element $index"))
      ),
    );
  }
}