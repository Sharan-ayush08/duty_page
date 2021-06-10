import 'package:flutter/material.dart';

class SubscriptionFilter extends StatelessWidget {
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 45.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10,
              child: Container(
                width: 90.0,
                color: colors[index],
              ),
            );
          }),
    );
  }
}
