import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {Navigator.pop(context);},
          child: Hero(
            tag: "DemoTag",
            child: Icon(
              Icons.add,
              size: 150.0,
            ),
            transitionOnUserGestures: true,
            flightShuttleBuilder: (flightContext, animation, direction,
                fromContext, toContext) {
              return Icon(Icons.rocket, size: 150.0,);
            },
          ),
        ),
      ),
    );
  }
}
