import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BatmanCityOic extends StatelessWidget {
  double percent;
  BatmanCityOic(this.percent);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _clipper(percent),
      child: Image.asset('assets/city.png'),
    );
  }
}

class _clipper extends CustomClipper<Path> {
  double percent;
  _clipper(this.percent);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height * (1 - percent));
    path.lineTo(0.0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
