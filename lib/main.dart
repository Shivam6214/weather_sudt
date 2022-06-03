import 'package:flutter/material.dart';
import 'package:weather/models.dart';
import 'data_service.dart';
import 'init_location.dart';
import 'loading_screen.dart';
import 'initial_locaion.dart';

void main() {
  LoadingScreen loadingScreen = LoadingScreen();
  runApp(MaterialApp(theme: ThemeData.dark(), home: Home()));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

// State Class
class _HomeState extends State<Home> {
  //Declarations
  final _dataService = DataService();
  final _locationHelper = LocationHelper();
  WeatherResponse _response;
  WeatherResponse _initresponse;
  TextEditingController _textEditingController = TextEditingController();

  //Initial run functions
  void initName() async {
    final lat = await _locationHelper.getCurrentLat();
    final long = await _locationHelper.getCurrentLong();
    _initresponse = await _dataService.getWeatherByCoordinates(lat, long);

    setState(() {
      _response = _initresponse;
    });
    print(_response.name);
  }

  void initState() {
    initName();
  }

  //Search function
  void _search(city) async {
    final response = await _dataService.getWeather(city);
    print(response.name);
    setState(() {
      _response = response;
    });
  }

  @override
  //UI
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          centerTitle: true,
          elevation: 10.0,
          backgroundColor: Colors.grey[800],
        ),
        body: Card(
          margin: const EdgeInsets.all(10.0),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (_response != null)
                if (_response.code == '200')
                  Column(children: [
                    TextField(
                      controller: _textEditingController,
                      autocorrect: true,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _search(_textEditingController.text);
                        },
                        child: const Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        )),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          _response.temp.toString(),
                          style: TextStyle(
                              color: Colors.grey[200],
                              letterSpacing: 1.0,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          _response.main,
                          style: TextStyle(
                              color: Colors.grey[200],
                              letterSpacing: 1.0,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          _response.name,
                          style: TextStyle(
                              color: Colors.grey[200],
                              letterSpacing: 1.0,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ])
                else
                  Column(children: [
                    TextField(controller: _textEditingController),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _search(_textEditingController.text);
                      },
                      child: Text("Search"),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(''),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(''),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text('')
                  ])
              else
                loading_screen()
            ]),
          ),
        ));
  }
}
