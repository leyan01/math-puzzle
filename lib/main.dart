import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle/Puzzle.dart';
import 'Data.dart';
import 'LevelPage.dart';

void main() {
  runApp(
    MaterialApp(
      home: Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  Myapp({super.key});
  int index = 0;
  int returnIndex() {
    print('fun==${Data.list}');
    Data.getData();
    print('fun==${Data.list}');
    return Data.list.indexOf('2');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Math Puzzles',
                  style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/blackboard_main_menu.png'),
                        fit: BoxFit.fill,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if(await Data.check()==false){
                                Data.getData();
                              }
                              if(Data.list[0]=='0'){
                                Data.list[0] = '2';
                                Data.setData();
                              }
                              print('on===${Data.list}');

                              print('on===${Data.list}');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Puzzle(returnIndex());
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'CONTINUE',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if(await Data.check()==false){
                                Data.getData();
                              }
                              if(Data.list[0]=='0'){
                                Data.list[0] = '2';
                                Data.setData();
                              }

                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const LevelPage();
                                },
                              ));
                            },
                            child: const Text(
                              'PUZZLES',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'BUY PRO',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // child: Image(
                  //   image: AssetImage('assets/blackboard_main_menu.png'),
                  //   fit: BoxFit.fill,
                  // ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
