import 'package:flutter/material.dart';

enum Pick {rock, paper, scissors, nothing}

String calResult(Pick player1, Pick player2) {
  if (player1 == Pick.nothing && player2 == Pick.nothing){
    return 'nothing';
  }
  else if (player1 == player2) {return 'Tie';}
  else if (player1 == Pick.rock) {
    return player2 == Pick.paper ? 'Player 2 won': 'Player 1 won';
  }
  else if (player1 == Pick.paper) {
    return player2 == Pick.rock ? 'Player 1 won' : 'Player 2 won';
  }
  else if (player1 == Pick.scissors) {
    return player2 == Pick.rock ? 'Player 2 won' : 'Player 1 won';
  }
  else {
    return 'error';
  }
}

class RockPaperScissors extends StatefulWidget {
  const RockPaperScissors({super.key});

  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  Pick player1 = Pick.nothing;
  Pick player2 = Pick.nothing;
  String _result = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rock, Paper, Scissors',
              style: TextStyle(fontSize: 30),
            ),

            const SizedBox(height: 40,),

            const Text('Player 1'),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      player1 = Pick.rock;
                    });
                  },
                  key: Key('p1r'),
                  child: const Text('Rock'),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      player1 = Pick.paper;
                    });
                  },
                  key: Key('p1p'),
                  child: const Text('Paper'),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      player1 = Pick.scissors;
                    });
                  },
                  key: Key('p1s'),
                  child: const Text('Scissors')
                ),
              ],
            ),

            const SizedBox(height: 40,),
          
            const Text('Player 2'),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      player2 = Pick.rock;
                    });
                  },
                  key: Key('p2r'),
                  child: const Text('Rock'),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      player2 = Pick.paper;
                    });
                  },
                  key: Key('p2p'),
                  child: const Text('Paper'),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      player2 = Pick.scissors;
                    });
                  },
                  key: Key('p2s'),
                  child: const Text('Scissors')
                ),
              ],
            ),

            const SizedBox(height: 40,),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = calResult(player1, player2);
                });
              },
              child: const Text('Result')
            ),

            const SizedBox(height: 40,),

            Text(
              'Player 1 $player1',
              key: Key('p1_pick'),
            ),

            Text(
              'Player 2 $player2',
              key: Key('p2_pick'),
            ),

            Text(
              '$_result',
              key: Key('result_text'),
            ),

          ],
        )
      ),
    );
  }
}