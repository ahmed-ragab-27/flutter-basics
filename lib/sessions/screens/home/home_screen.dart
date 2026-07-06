import 'package:flutter/material.dart';
import 'package:flutter_c19/sessions/screens/home/car_dm.dart';
import 'package:flutter_c19/sessions/screens/home/car_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  List<CarDm> cars = [
    CarDm(name: 'Adamas', image: 'assets/images/car1.jpg'),
    CarDm(name: 'ROX 01', image: 'assets/images/car2.jpg'),
    CarDm(name: 'Adamas', image: 'assets/images/car1.jpg'),
    CarDm(name: 'ROX 01', image: 'assets/images/car2.jpg'),
    CarDm(name: 'Adamas', image: 'assets/images/car1.jpg'),
    CarDm(name: 'ROX 01', image: 'assets/images/car2.jpg'),
    CarDm(name: 'Adamas', image: 'assets/images/car1.jpg'),
    CarDm(name: 'ROX 01', image: 'assets/images/car2.jpg'),
    CarDm(name: 'Adamas', image: 'assets/images/car1.jpg'),
    CarDm(name: 'ROX 01', image: 'assets/images/car2.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff024383),
              ),
              child: Text(
                'Available cars',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: cars.length,
                itemBuilder: (context, index) => CarWidget(cars[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
