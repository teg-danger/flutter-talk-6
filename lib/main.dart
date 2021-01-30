import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/pages/home.dart';
import 'package:talk/pages/settings.dart';
import 'package:talk/states/global_state.dart';

import 'pages/components/bottom_navigation.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GlobalState(),
          
         )
      ],
      child:  MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter talk cameroun'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final pages =[
    Home(),
    Settings()
  ];
   MyHomePage({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<GlobalState>().increment();
              },
              child: Icon(Icons.add),
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: FloatingActionButton(
               backgroundColor: Colors.red,
              onPressed: () {
                context.read<GlobalState>().generateValue();
              },
              child: Icon(Icons.tap_and_play),
          ),
           ),
        ],
      ),
      bottomNavigationBar: BottonNavigation(),
      body: Selector<GlobalState, int>(
        builder: (_,value,__){
        print('ici je dans le consumer de change de page');
          return pages[value];
        },
        selector: (_,state) => state.index,
      ),
      
    );
  }
}

