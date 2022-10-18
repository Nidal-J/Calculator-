import 'package:flutter/material.dart';

class OperatorSymbol extends StatelessWidget {
  const OperatorSymbol({
    required this.operator,
    this.color = Colors.white70,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String operator;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: const Color(0xFF282B33),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          operator,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
