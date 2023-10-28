import 'package:flutter/material.dart';
import 'package:math_puzzle/Puzzle.dart';
import 'package:math_puzzle/main.dart';

class WinPage extends StatelessWidget {
  int index;

  WinPage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'PUZZLE ${index + 1} COMPLETED',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Image(
                image: AssetImage('assets/trophy.png'),
                height: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              btnBuilder('Continue', context),
              btnBuilder('Main Menu', context),
              btnBuilder('Share', context),
            ],
          ),
        ],
      ),
    );
  }

  Widget btnBuilder(String name, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (name == 'Main Menu') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Myapp(),
              ),
              (route) => true);
        }else if(name == 'Continue'){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Puzzle(index+1),), (route) => true);
        }
      },
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
