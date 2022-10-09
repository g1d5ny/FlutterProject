import 'package:flutter/material.dart';

class HomeScreenStless extends StatelessWidget {
  final Color color;

  const HomeScreenStless({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow);
  }
}
