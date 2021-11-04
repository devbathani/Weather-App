// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/Api%20Manager/api_manager.dart';
import 'package:weather_app/animations/animated_sun_and_moon.dart';
import 'package:weather_app/model/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var theme;
  final _textcontroller = TextEditingController();
  String city = 'vadodara';

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;
    var screenW = MediaQuery.of(context).size.width;
    Widget change() {
      if (DateTime.now().hour >= 6 && DateTime.now().hour < 18) {
        setState(() {
          theme = 'images/morning.jpg';
        });
      } else if (DateTime.now().hour >= 18 && DateTime.now().hour <= 5) {
        setState(() {
          theme = 'images/night.jpg';
        });
      } else {
        setState(() {
          theme = 'images/night.jpg';
        });
      }
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(theme),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenW / 20, vertical: screenW / 9),
              child: TextField(
                controller: _textcontroller,
                decoration: InputDecoration(
                    hintText: 'Enter Location',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontFamily: 'Zen'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (_textcontroller.text != Null) {
                            setState(() {
                              city = _textcontroller.text;
                            });
                          } else {
                            setState(() {
                              city = 'vadodara';
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ))),
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.name,
              ),
            ),
            FutureBuilder<WeatherModel>(
              future: Api_Manager().getWeatherData(city),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      snapshot.data!.name,
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
                                            snapshot.data!.main.temp.toString(),
                                            style: TextStyle(
                                                fontSize: screenW / 7,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '\u2103',
                                            style: TextStyle(
                                                fontSize: screenW / 7,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: screenW * 0.21),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenH / 40,
                                  ),
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
                                          snapshot.data!.weather[0].main,
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
                              height: screenH * 0.15,
                              width: screenW * 0.20,
                              child: AnimatedSunandMoon(),
                            ),
                          ),
                          SizedBox(height: screenH * 0.07),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenW * 0.05),
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
                                              snapshot.data!.main.tempMin
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
                                              snapshot.data!.main.tempMax
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
                            height: screenH * 0.04,
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
                                      snapshot.data!.coord.lat.toString(),
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
                                      snapshot.data!.coord.lon.toString(),
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
                            height: screenH * 0.03,
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
                                                snapshot.data!.main.pressure
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenW / 20),
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
                                                snapshot.data!.main.humidity
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenW / 20),
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
                                                    snapshot
                                                        .data!.main.feelsLike
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
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                }
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: change(),
    );
  }
}
