import 'package:flutter/material.dart';
import 'package:tictactoe/game_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<GameButton> buttonList;
@override
  void initState() {
    
    super.initState();
    buttonList = doInit();
  }
  List<GameButton> doInit() {
      var gameButton = <GameButton>[
        new GameButton(id: 1),
        new GameButton(id: 2),
        new GameButton(id: 3),
        new GameButton(id: 4),
        new GameButton(id: 5),
        new GameButton(id: 6),
        new GameButton(id: 7),
        new GameButton(id: 8),
        new GameButton(id: 9),
      ];
      return gameButton;


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Tic Tac Toe')
      ),
      body: new GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: buttonList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 9,
          mainAxisSpacing: 9,),
         itemBuilder: (context,i)=>new SizedBox(
           width: 100,
           height: 100,
           child: new RaisedButton(
             padding: const EdgeInsets.all(8),
             onPressed: null,
             child: new Text(buttonList[i].text,
             style: new TextStyle(
               color: Colors.white, fontSize: 20),

             ),
             color: buttonList[i].bg,
             disabledColor: buttonList[i].bg,
             ),
             
           ),   
             ),
            
             );
        

  }

  


  }


