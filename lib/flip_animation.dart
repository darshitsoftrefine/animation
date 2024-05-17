import 'dart:math';
import 'package:flutter/material.dart';
import 'package:implement_animation/hero_animation/page1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Widget front = const Card1();
  Widget back = const Card2();
  late Widget _card = front;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _controller.addListener(() {
      if (_controller.value >= .5 && _card != back) {
        setState(() => _card = back);
      } else if (_controller.value < .5 && _card != front) {
        setState(() => _card = front);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Flip"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_controller.value == 1) {
              _controller.reverse(from: 1);
            } else {
              _controller.forward(from: 0);
            }
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (c, anim) => Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0025)
                ..rotateY(_controller.value * pi),
              alignment: FractionalOffset.center,
              child: _card,
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Page1()),
          );
        },
        child: const Text("Hero Animation")
    ),
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 300,
      color: Colors.teal,
      child:const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Card1'),
          Text('I\'m front of the card'),
        ],
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: -1,
      child: Container(
        width: 150,
        height: 300,
        color: Colors.blue,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Card2'),
            Text('I\'m back of the card'),
          ],
        ),
      ),
    );
  }
}