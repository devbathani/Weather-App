// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/Api%20Manager/api_manager.dart';
import 'package:weather_app/animations/animated_sun.dart';
import 'package:weather_app/model/weather_model.dart';

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
            image: AssetImage('images/night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<WeatherModel>>(
          future: Api_Manager().getWeatherData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenH * 0.10,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: screenW / 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].name,
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenW / 99),
                                      child: Row(
                                        children: [
                                          Text(
                                            snapshot.data![index].main.temp
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: screenW / 5,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\u2103',
                                            style: TextStyle(
                                                fontSize: screenW / 5,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: screenW * 0.14),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenH / 40),
                                  child: Container(
                                    width: screenW * 0.12,
                                    height: screenH * 0.15,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.2, color: Colors.white),
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                      child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          snapshot.data![index].weather.main,
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
                            padding:
                                EdgeInsets.symmetric(horizontal: screenW / 2.5),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data![index].main.tempMin
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenW / 20),
                                            ),
                                            Text(
                                              '\u2103',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenW / 20),
                                            )
                                          ],
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
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data![index].main.tempMax
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenW / 20),
                                            ),
                                            Text(
                                              "\u2103",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenW / 20),
                                            )
                                          ],
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
                                      snapshot.data![index].coord.lat
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenW / 20),
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
                                      snapshot.data![index].coord.lon
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenW / 20),
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
                            padding:
                                EdgeInsets.symmetric(horizontal: screenW / 25),
                            child: Container(
                              height: screenH * 0.12,
                              width: screenW * 0.92,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.2, color: Colors.white),
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
                                                snapshot
                                                    .data![index].main.pressure
                                                    .toString(),
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
                                                snapshot
                                                    .data![index].main.humidity
                                                    .toString(),
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
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data![index].main
                                                        .feelsLike
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: screenW / 20),
                                                  ),
                                                  Text(
                                                    '\u2103',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: screenW / 20),
                                                  )
                                                ],
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
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
            }
          },
        ),
      ),
    );
  }
}
