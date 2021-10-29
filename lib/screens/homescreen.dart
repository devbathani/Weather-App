// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/animations/animated_sun.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;
    var screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/morning.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenH * 0.10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW / 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Umbergoan",
                    style: TextStyle(
                      fontSize: screenW / 11,
                      fontFamily: 'Zen',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: screenH * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenW / 99),
                    child: Text(
                      "23.5\u2103",
                      style: TextStyle(
                          fontSize: screenW / 5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenH * 0.08,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW / 2.5),
              child: Container(
                height: screenH * 0.23,
                width: screenW * 0.23,
                child: AnimatedSun(),
              ),
            ),
            SizedBox(
              height: screenH * 0.20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW / 20),
              child: Container(
                height: screenH * 0.10,
                width: screenW * 0.90,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.white),
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Humidity",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Zen',
                          fontSize: screenW / 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
