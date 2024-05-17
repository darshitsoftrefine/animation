import 'package:flutter/material.dart';
import 'package:implement_animation/flip_animation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              //alignment: selected ? Alignment.center : AlignmentDirectional.topStart,
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0, top: 5.0),
            child: Center(
              child: Text("Navigate"),
            ),
          ),
        ),
      ),
      // floatingActionButton: GestureDetector(
      //   onTap: () {Navigator.pop(context);},
      //   child: Hero(
      //     tag: "DemoTag",
      //     child: Icon(
      //       Icons.add,
      //       size: 150.0,
      //     ),
      //     flightShuttleBuilder: (flightContext, animation, direction,
      //         fromContext, toContext) {
      //       return Icon(Icons.rocket, size: 150.0,);
      //     },
      //     placeholderBuilder: (context, size, widget) {
      //       return Container(
      //         height: 150.0,
      //         width: 150.0,
      //         child: CircularProgressIndicator(),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}