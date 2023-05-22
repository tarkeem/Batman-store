import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:vector_math/vector_math.dart' as vector;

class BatManButton extends StatefulWidget {
  String text;
  void Function() onTap;
  BatManButton({required this.text, required this.onTap});

  @override
  State<BatManButton> createState() => _BatManButtonState();
}

class _BatManButtonState extends State<BatManButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('inner active');
          widget.onTap();
        },
        child: Container(
          height: 40,
          color: Colors.yellow,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.rotate(
                    angle: vector.radians(45),
                    child:
                    Transform.scale(
                      scaleX: 2,
                      scaleY: 4,
                      child: Lottie.asset(
                        'assets/images/batman.json',
                      ),
                    )),
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                SizedBox.shrink()
              ],
            ),
          ),
        ));
  }
}
