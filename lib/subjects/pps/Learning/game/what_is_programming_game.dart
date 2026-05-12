import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame/effects.dart';


class WhatIsProgrammingGame extends FlameGame {

  late SpriteComponent ant;

  String direction = "up";

  @override
  Future<void> onLoad() async {

    super.onLoad();

    // BACKGROUND
    final background =
    SpriteComponent()

      ..sprite =
      await loadSprite(
        'game/w_i_programming/background.png',
      )

      ..size = size

      ..position =
      Vector2.zero();

    add(background);

    // HOME
    final home =
    SpriteComponent()

      ..sprite =
      await loadSprite(
        'game/w_i_programming/home.png',
      )

      ..size =
      Vector2(102, 97)

      ..position =
      Vector2(40, 20);

    add(home);

    // ANT
    ant = SpriteComponent()

      ..sprite =
      await loadSprite(
        'game/w_i_programming/ant.png',
      )

      ..size =
      Vector2(90, 90)

      ..position =
      Vector2(230, 620);

    add(ant);
  }

  // LEFT
  void moveLeft() {

    if(
    ant.position.y <= 160 &&
        ant.position.x > 50){

      if(direction != "left"){

        ant.angle = -1.6;

        ant.position.y += 40;
      }

      direction = "left";

      ant.position.x -= 40;
    }
  }

  // RIGHT
  void moveRight() {}

  // FORWARD
  void moveUp() {

    // UP ROAD
    if(direction == "up"){

      if(ant.position.y > 160){

        ant.add(

          MoveEffect.by(

            Vector2(0, -40),

            EffectController(
              duration: 0.3,
            ),
          ),
        );
      }
    }

    // LEFT ROAD
    else if(direction == "left"){

      if(ant.position.x > 50){

        ant.add(

          MoveEffect.by(

            Vector2(-40, 0),

            EffectController(
              duration: 0.3,
            ),
          ),
        );
      }
    }
  }

  // DOWN
  void moveDown() {}
}

class WhatIsProgrammingGamePage
    extends StatefulWidget {

  const WhatIsProgrammingGamePage({
    super.key,
  });

  @override
  State<WhatIsProgrammingGamePage>
  createState() =>
      _WhatIsProgrammingGamePageState();
}

class _WhatIsProgrammingGamePageState
    extends State<WhatIsProgrammingGamePage> {

  @override
  void initState() {

    super.initState();

    Future.delayed(
       Duration(milliseconds: 500),

          () {

        FlameAudio.play(
          'instruction.mp3',
        );
      },
    );
  }


  final game =
  WhatIsProgrammingGame();

  String bubbleText =
      "Give me Instruction\nwhat to do!";
  bool levelCompleted = false;

  // SHOW BUBBLE
  void showBubble(String text) {

    setState(() {

      bubbleText = text;

    });

    Future.delayed(
       Duration(seconds: 2),

          () {

        setState(() {

          bubbleText = "";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          // GAME
          GameWidget(
            game: game,
          ),

          // BUBBLE
          if(bubbleText.isNotEmpty)

            Positioned(

              top: 120,
              left: 40,

              child: Container(

                padding:
                EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(20),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black
                          .withOpacity(0.2),

                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Text(

                  bubbleText,

                  style: const TextStyle(

                    fontSize: 20,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

          // BUTTON PANEL
          Positioned(

            bottom: 0,
            left: 0,
            right: 0,

            child: Container(

              height: 170,

              decoration:
              const BoxDecoration(

                color:
                Color(0xff143d73),

                borderRadius:
                BorderRadius.only(

                  topLeft:
                  Radius.circular(30),

                  topRight:
                  Radius.circular(30),
                ),
              ),

              child: Center(

                child: Padding(

                  padding:
                  EdgeInsets.only(
                    bottom: 40,
                  ),

                  child: Column(

                    mainAxisSize:
                    MainAxisSize.min,

                    children: [

                      // UP
                      controlButton(

                        Icons.keyboard_arrow_up,

                            () {
                              if(levelCompleted) return;
                          // FIRST ROAD
                          if(game.direction == "up" &&
                              game.ant.position.y > 140){

                            game.moveUp();

                            showBubble("Correct");


                          }

                          // LEFT ROAD
                          else if(
                          game.direction == "left" &&
                              game.ant.position.x > 30){

                            game.moveUp();

                            // FINISH
                            if(game.ant.position.x <= 110){

                              showBubble("Nice! You did it");


                              FlameAudio.play(
                                'yayy.mp3',
                              );

                              setState(() {

                                levelCompleted = true;
                              });
                            }

                            else{

                              showBubble("Correct");

                              FlameAudio.play(
                                'lalala.mp3',
                              );
                            }
                          }

                          // WRONG
                          else{

                            showBubble("Wrong Action");
                            FlameAudio.play(
                              'oops.mp3',
                            );
                          }
                        },
                      ),

                       SizedBox(
                        height: 0,
                      ),

                      // LEFT RIGHT
                      Row(

                        mainAxisSize:
                        MainAxisSize.min,

                        children: [

                          // LEFT
                          controlButton(

                            Icons.keyboard_arrow_left,

                                () {
                                  if(levelCompleted) return;
                              // TURN AREA
                                  if(game.ant.position.y <= 180 &&
                                      game.ant.position.x > 50){

                                game.moveLeft();

                            }},
                          ),

                          SizedBox(
                            width: 30,
                          ),

                          // RIGHT
                          controlButton(

                            Icons.keyboard_arrow_right,

                                () {
                                  if(levelCompleted) return;
                              showBubble("Wrong Action");
                              FlameAudio.play(
                                'oops.mp3',
                              );
                            },
                          ),
                        ],
                      ),

                       SizedBox(
                        height: 0,
                      ),

                      // DOWN
                      controlButton(

                        Icons.keyboard_arrow_down,

                            () {
                              if(levelCompleted) return;
                          showBubble("Wrong Action");
                          FlameAudio.play(
                            'oops.mp3',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // LEVEL COMPLETE
          if(levelCompleted)

            Container(

              color:
              Colors.black.withOpacity(0.7),

              child: Center(

                child: Container(

                  margin:
                  EdgeInsets.all(30),

                  padding:
                  EdgeInsets.all(25),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(25),
                  ),

                  child: Column(

                    mainAxisSize:
                    MainAxisSize.min,

                    children:  [

                      Text(

                        " Level Complete",

                        style: TextStyle(

                          fontSize: 30,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 15),

                      Text(

                        "You gave\ncorrect instructions!",

                        textAlign:
                        TextAlign.center,

                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      /// Back Button
                      SizedBox(height: 25),

                      ElevatedButton(

                        onPressed: () {

                          Navigator.pop(context);
                        },

                        child: const Text(
                          "Back",
                        ),
                      ),

                    ],
                  ),

                ),
              ),
            ),
        ],
      ),
    );
  }

  // BUTTON
  Widget controlButton(

      IconData icon,

      VoidCallback onTap,
      ) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        height: 35,
        width: 35,

        decoration: BoxDecoration(

          color:
          const Color(0xff89A8FF)
              .withOpacity(0.6),

          shape: BoxShape.circle,

          boxShadow: [

            BoxShadow(

              color:
              const Color(0xff89A8FF)
                  .withOpacity(0.4),

              blurRadius: 15,

              spreadRadius: 2,
            ),
          ],
        ),

        child: Icon(

          icon,

          color: Colors.white,

          size: 25,
        ),
      ),
    );
  }
}