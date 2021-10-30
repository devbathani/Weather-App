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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                  SizedBox(width: screenW * 0.14),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenH / 40),
                    child: Container(
                      width: screenW * 0.12,
                      height: screenH * 0.15,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2, color: Colors.white),
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "Clouds",
                            style: TextStyle(
                                fontSize: screenW / 13.5,
                                fontFamily: 'Zen',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenH * 0.01,
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
              height: screenH * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latitude',
                    style: TextStyle(
                        fontSize: screenW / 20,
                        fontFamily: 'Zen',
                        color: Colors.white),
                  ),
                  Text(
                    'Longitude',
                    style: TextStyle(
                        fontSize: screenW / 20,
                        fontFamily: 'Zen',
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenH * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW / 20),
              child: Container(
                height: screenH * 0.12,
                width: screenW * 0.90,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.white),
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Pressure",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Zen',
                              fontSize: screenW / 20,
                            ),
                          ),
                          SizedBox(
                            width: screenW * 0.07,
                          ),
                          Text(
                            "Humidity",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Zen',
                              fontSize: screenW / 20,
                            ),
                          ),
                          SizedBox(
                            width: screenW * 0.07,
                          ),
                          Text(
                            "Feels Like",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Zen',
                              fontSize: screenW / 20,
                            ),
                          ),
                        ],
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
