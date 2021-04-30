import 'package:flutter/material.dart';
import 'package:tictactoe/custom_dialog.dart';
import 'package:tictactoe/game_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<GameButton> buttonList;
var player1;
var player2;
var activePlayer;
@override
  void initState() {
    
    super.initState();
    buttonList = doInit();
  }
  List<GameButton> doInit() {
      player1 = new List();
      player2 = new List();
      activePlayer =1;


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

  void playGame(GameButton gb){
setState(() {
  if (activePlayer ==1){
      gb.text="X";
      gb.bg= Colors.red;
      activePlayer =2;
      player1.add(gb.id);
  }else{
    gb.text="O";
    gb.bg=Colors.black;
    activePlayer=1;
    player2.add(gb.id);
  }
  gb.enabled=false;
  checkWinner();
});
  }
void checkWinner(){
  var winner = -1;
  if(player1.contains(1)&&player1.contains(2)&&player1.contains(3)){
    winner=1;
  }
  if(player2.contains(1)&&player2.contains(2)&&player2.contains(3)){
    winner=1;
  }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner!=-1){
      if(winner==1){
  showDialog(
    context: context, 
  builder:(_)=> new CustomDialog("Player 1 Won","Press reset Button to start again", resetGame));
      }
      else{
        showDialog(
    context: context, 
  builder:(_)=> new CustomDialog("Player 2 Won","Press reset Button to start again", resetGame));

      }
    }
  
  }

void resetGame(){
if(Navigator.canPop(context)){Navigator.pop(context);}
setState(() {
  buttonList=doInit();
});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Tic Tac Toe')
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Expanded(
            child: new GridView.builder(
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
                 onPressed:  buttonList[i].enabled?()=> playGame(buttonList[i]):null,
                 child: new Text(buttonList[i].text,
                 style: new TextStyle(
                   color: Colors.white, fontSize: 20),

                 ),
                 color: buttonList[i].bg,
                 disabledColor: buttonList[i].bg,
                 ),
                 
               ),   
                 ),
          ),
          new RaisedButton(
            child: new Text(
              "Reset",
              style: new TextStyle(color: Colors.white,fontSize:20),
            ),
            color: Colors.red,
            padding: const EdgeInsets.all(20),
            onPressed: resetGame),
          
          ],
    
      ),
            
             );
        

  }

  


  }


