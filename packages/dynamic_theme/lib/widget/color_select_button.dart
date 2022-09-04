import 'package:flutter/material.dart';

class ColorSelectButton extends StatelessWidget {
  final Color color;
  final void Function() handleOnTap;

  const ColorSelectButton(
      {required this.color, required this.handleOnTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 90,
        child: InkWell(
          onTap: handleOnTap,
          child: Card(
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: color,
          ),
        ),
      );
}
