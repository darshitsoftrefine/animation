import 'package:flutter/material.dart';
import 'package:implement_animation/animated_text.dart';
import 'package:implement_animation/flip_animation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AnimatedContainer(
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              color: selected ? Colors.red : Colors.blue,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
          },
        child: Container(
          width: 50,
          height: 60,
          decoration: const BoxDecoration(color: Colors.teal,),
          child: const Padding(
            padding: EdgeInsets.only(bottom: 18.0, top: 5.0),
            child: Center(
              child: Text("Navigate"),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  Navigator.push(
                 context,
            MaterialPageRoute(builder: (context) => const AnimatedText()),
        );
    },
        child: Icon(Icons.animation),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}