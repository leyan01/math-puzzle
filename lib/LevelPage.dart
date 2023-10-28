import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle/Puzzle.dart';

import 'Data.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: Data.list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (Data.list[index] != '0') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Puzzle(index);
                      },
                    ),
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.all(
                  10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Data.list[index] == '0'
                    ? const Image(
                        image: AssetImage('assets/lock.png'),
                      )
                    : Data.list[index] == '1'
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              Text('${index + 1}'),
                              const Image(
                                image: AssetImage('assets/tick.png'),
                              ),
                            ],
                          )
                        : Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 50),
                          ),
              ),
            );
          },
        ),
      ),
    ));

  }
}
