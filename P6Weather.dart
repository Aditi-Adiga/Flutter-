#Weather App

dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.6
  
 == 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatefulWidget {
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  TextEditingController cityCtrl = TextEditingController();

  String result = "Enter a country or city";

  Future getWeather(String city) async {
    String apiKey = "YOUR_API_KEY";

    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      var response = await http.get(Uri.parse(url));

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          result =
              "$city : ${data['main']['temp']}°C, ${data['weather'][0]['description']}";
        });
      } else {
        setState(() {
          result = "City not found";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error fetching weather";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Checker"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: cityCtrl,
              decoration: InputDecoration(
                labelText: "Enter city/country",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                getWeather(cityCtrl.text);
              },
              child: Text("Check Weather"),
            ),

            SizedBox(height: 30),

            Text(
              result,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
