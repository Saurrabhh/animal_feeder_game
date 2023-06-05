import 'package:animal_feeder_game/constants/colors.dart';
import 'package:flutter/material.dart';

class CornerBorder extends StatelessWidget {
  const CornerBorder({Key? key, this.left, this.right, this.top, this.bottom})
      : super(key: key);
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  final borderSide = const BorderSide(color: kPrimaryColor, width: 2.0);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          border: Border(
            top: top != null ? borderSide:BorderSide.none,
            right: right != null ? borderSide:BorderSide.none,
            bottom: bottom != null ? borderSide:BorderSide.none,
            left: left != null ? borderSide:BorderSide.none,
          ),
        ),
      ),
    );
  }
}
