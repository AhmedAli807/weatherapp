import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch:
                Provider.of<WeatherProvider>(context).weatherData == null
                    ? Colors.orange
                    : Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .getThemeColor()),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
