import 'package:flutter/material.dart';


class ReuseableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function tapcallback;

  ReuseableCard({
    this.color = const Color(0xFF1D1F31),
    this.child,
    this.tapcallback,
  });

  // const ReuseableCard({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapcallback,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}