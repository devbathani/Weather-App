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
              height: 0.10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '24.98\u2103 ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            ": Min Temp",
                            style: TextStyle(
                                fontSize: screenW / 20,
                                fontFamily: 'Zen',
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenH * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            '24.98\u2103 ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            " : Max Temp",
                            style: TextStyle(
                                fontSize: screenW / 20,
                                fontFamily: 'Zen',
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenH * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Latitude   : ',
                        style: TextStyle(
                            fontSize: screenW / 20,
                            fontFamily: 'Zen',
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: screenW * 0.01,
                      ),
                      Text(
                        '22.3',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenH * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Longitude : ',
                        style: TextStyle(
                            fontSize: screenW / 20,
                            fontFamily: 'Zen',
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: screenW * 0.01,
                      ),
                      Text(
                        '73.2',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenH * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW / 25),
              child: Container(
                height: screenH * 0.12,
                width: screenW * 0.92,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.white),
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 29, vertical: 15),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Column(
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
                                  height: screenH * 0.01,
                                ),
                                Text(
                                  '1014',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenW * 0.07,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Humidity",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Zen',
                                    fontSize: screenW / 20,
                                  ),
                                ),
                                SizedBox(
                                  height: screenH * 0.01,
                                ),
                                Text(
                                  '33',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenW * 0.07,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Feels Like",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Zen',
                                    fontSize: screenW / 20,
                                  ),
                                ),
                                SizedBox(
                                  height: screenH * 0.01,
                                ),
                                Text(
                                  '31.16 \u2103',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
