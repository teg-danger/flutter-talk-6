
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/states/global_state.dart';
import 'package:tuple/tuple.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('vous m\'avez taper ce nombre de fois',
          style: Theme.of(context).textTheme.headline5,),
          Selector<GlobalState, Tuple2<bool, int>>(
            builder: (_,value,__){
                if(value.item1) return CircularProgressIndicator();
                return  Text('Random value ${value.item2}', style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center); 
          },
          selector: (_, state) => Tuple2(state.loading, state.randomValue),
          ),
          Selector<GlobalState,int>(
            builder: (_,value,__){
                print('je suis le dans le changement count');
                return Text('${value}', style: Theme.of(context).textTheme.headline2,);
            },
            selector: (_,state) => state.count,
            
          )
        ]
      ),
    );
  }
}

