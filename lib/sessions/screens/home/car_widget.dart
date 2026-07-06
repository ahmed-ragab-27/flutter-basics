import 'package:flutter/material.dart';
import 'package:flutter_c19/sessions/screens/home/car_dm.dart';

class CarWidget extends StatelessWidget {
  CarDm car;

  CarWidget(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            car.image,
            height: 160,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff024383),
          ),
          child: Text(
            car.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
