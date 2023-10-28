import 'package:flutter/material.dart';
import 'package:math_puzzle/Data.dart';
import 'package:math_puzzle/WinPage.dart';

class Puzzle extends StatefulWidget {
  int index;

  Puzzle(this.index, {super.key});

  @override
  State<Puzzle> createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/gameplaybackground.jpg'),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 844,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Data.list[widget.index] = '2';
                        Data.list[(widget.index)+1] = '2';
                        Data.setData();
                        setState(() {
                          widget.index += 1;
                        });
                      },
                      child: const Image(
                        image: AssetImage('assets/skip.png'),
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/level_board.png'),
                              fit: BoxFit.fill),
                        ),
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text(
                          'Level ${widget.index + 1}',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Image(
                      //   image: AssetImage('assets/level_board.png'),
                      //   height: 80,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Image(
                      image: AssetImage('assets/hint.png'),
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Image(
                    image: AssetImage('assets/p${widget.index + 1}.png'),
                  ),
                ),
                const Spacer(),
                Container(
                  color: Colors.grey.shade900,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: 50,
                              height: 45,
                              color: Colors.white,
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                input,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  input = input.substring(0, input.length - 1);
                                });
                              },
                              child: const Image(
                                image: AssetImage('assets/delete.png'),
                                height: 50,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () async {
                                if (input == (widget.index + 1).toString()) {
                                  Data.list[widget.index] = '1';
                                  Data.list[widget.index + 1] = '2';
                                  Data.setData();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return WinPage(widget.index);
                                      },
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          numberBtn('1'),
                          numberBtn('2'),
                          numberBtn('3'),
                          numberBtn('4'),
                          numberBtn('5'),
                          numberBtn('6'),
                          numberBtn('7'),
                          numberBtn('8'),
                          numberBtn('9'),
                          numberBtn('0'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget numberBtn(String num) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            input = input + num;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white60),
          ),
          child: Text(
            num,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
