import 'package:flutter/material.dart';
import 'package:implement_animation/hero_animation/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () { Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Page2()),
          );},
          child:  const Hero(
            tag: "DemoTag",
            child: Icon(
              Icons.add,
              size: 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
