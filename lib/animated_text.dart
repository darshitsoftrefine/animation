import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Text"),
      ),
      body: SizedBox(
        height: 205,
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.orange,
            fontSize: 45,
          ),
          child: Column(
            children: [
              AnimatedTextKit(
                repeatForever: false,
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText('Learn from docs, courses, youtube, and many more.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
