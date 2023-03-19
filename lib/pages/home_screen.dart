import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
WeatherModel? weatherData;

String ?cityName;

  @override
  Widget build(BuildContext context) {
    TextEditingController textController=TextEditingController();
    double widthSize=MediaQuery.of(context).size.width*0.7;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
AnimSearchBar(width: widthSize, textController: textController, onSuffixTap: (){
  setState(() {
    textController.clear();
  });
}, onSubmitted: (data)async{

      cityName=data;
      WeatherService service=WeatherService();
      WeatherModel ?weather=await service.getWeather(cityName: cityName!);
      weatherData =weather;
      Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
      Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

    },
  )
        ],
      ),
      body:weatherData==null? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
             Text('There is no weather start search now',
             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold
             ),)
          ],
        ),
      ):
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Spacer(flex: 3,),

                   Text(Provider.of<WeatherProvider>(context).cityName??"",style: const TextStyle(
                    fontSize: 22,
                  ),),
                  const Spacer(flex: 3,),
                   Text('updated at : ${weatherData?.date??''}'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                          Image.asset(weatherData?.getImage()??''),
                       Text(weatherData?.temp.toInt().toString()??'',style: const TextStyle(
                        fontSize: 22,
                      ),),
                      Column(
                        children: [
                          Text('Max temp : ${weatherData?.maxTemp.toInt()??''}'),
                          Text('Min temp : ${weatherData?.minTemp.toInt()??''}')
                        ],
                      ),

                    ],

                  ),
                 const Spacer(flex: 5,),
                   Text(weatherData?.weatherStateName??'',style: const TextStyle(
                    fontSize: 22,
                  ),),
                  const Spacer(flex: 5,),

                ],

              ),
            ),
          )
    );
  }
}
