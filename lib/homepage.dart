import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:math' as math;

const double defaultLogoScale = .5;
const double defaultLogoAngle = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double logoScale = defaultLogoScale;
  double logoAngle = defaultLogoAngle;
  void increaseLogoSize() {
    if (logoScale + .1 <= 2) {
      setState(() {
        logoScale += .1;
      });
    }
  }

  void decreaseLogoSize() {
    if (logoScale - .1 >= .1) {
      setState(() {
        logoScale -= .1;
      });
    }
  }

  void increaseLogoAngle() {
    setState(() {
      logoAngle = (logoAngle + math.pi / 4) % (2 * math.pi);
    });
  }

  void decreaseLogoAngle() {
    setState(() {
      logoAngle = (logoAngle - math.pi / 4) % (-(2 * math.pi));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(15),
                  child: Center(
                      child: Transform.scale(
                    scale: logoScale,
                    child: Transform.rotate(
                      angle: logoAngle,
                      child: Image.asset(
                        "assets/liquidgalaxylogo.png",
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.rotate_left_rounded),
                        onPressed: decreaseLogoAngle,
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.rotate_right_rounded),
                        onPressed: increaseLogoAngle,
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        icon: const Icon(Icons.remove_rounded),
                        onPressed: decreaseLogoSize,
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_rounded,
                        ),
                        onPressed: increaseLogoSize,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
