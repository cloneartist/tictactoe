import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tictactoe/custom_dialog.dart';
import 'package:tictactoe/game_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<GameButton> buttonList;
var player1;
final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(Rect.fromLTWH(7.0, 3.0, 200.0, 70.0));
var player2;
var activePlayer;
@override
  void initState() {
    
    super.initState();
    buttonList = doInit();
  }
  List<GameButton> doInit() {
      player1 = new List<int>.empty(growable: true);
      player2 = new List<int>.empty(growable: true);
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
  int winner =checkWinner();
  if(winner == -1){
    if(buttonList.every((p) =>p.text!="")){
      showDialog(context: context, builder:(_)=>new CustomDialog("Game Tied", "Press the reset button to start again", resetGame));
    }
    else{
      // ignore: unnecessary_statements
      activePlayer==2?autoPlay():null;
    }
  }
});
  }

  void autoPlay()
  {
    var emptyCells = new List<int>.empty(growable: true);
    var list=new List.generate(9, (i) => i+1);
    for (var cellID in list)
    {
        if(!(player1.contains(cellID)||player2.contains(cellID)))
            {
              emptyCells.add(cellID);
            }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellID = emptyCells[randIndex];
    int i= buttonList.indexWhere((p) => p.id==cellID);
    playGame(buttonList[i]);
  }
int checkWinner(){
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
  return winner;
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
      backgroundColor: Colors.white,
      
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          SizedBox(width: 30,height: 100,),
          new Column(
              children: [new NeumorphicText("Tic-Tac-Toe",style: NeumorphicStyle(
                depth: 4,color: Color(0xff8921aa)
              ),
              textStyle: NeumorphicTextStyle(fontSize: 30),),
              ],
          ),
          SizedBox(width: 30,height: 50,),
          Expanded(
            child: Container(
              child: new GridView.builder(
                
              padding: const EdgeInsets.all(10.0),
              itemCount: buttonList.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,),
               itemBuilder: (context,i)=>new SizedBox(
                child:new NeumorphicButton(
                  style: NeumorphicStyle(
                    color: Colors.white,
                    shape: NeumorphicShape.flat,
                  ),
                  onPressed: buttonList[i].enabled?()=> playGame(buttonList[i]):null, 
                  child: Text(buttonList[i].text,style: TextStyle(foreground: Paint()..shader=linearGradient,letterSpacing: 20,fontSize: 100,height: 1.07),),
                 
                ),
       
                 ),   
                   ),
            ),
          ),
          new ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( Colors.white),
              padding: MaterialStateProperty.all(EdgeInsets.all(15))
            ),
            child: new Text(
              "Reset",
              style: new TextStyle(color: Color(0xff8921aa),fontSize:20),
            ),
            onPressed: resetGame),
          
          ],
    
      ),
   );
  }
}


