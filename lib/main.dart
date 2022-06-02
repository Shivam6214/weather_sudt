import 'package:flutter/material.dart';
import 'package:weather/models.dart';
import 'data_service.dart';
import 'init_location.dart';
import 'loading_screen.dart';
import 'initial_locaion.dart';

void main() {
  LoadingScreen loadingScreen=LoadingScreen();
  runApp(MaterialApp(theme: ThemeData.dark(),home: Home()));
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

// State Class
class _HomeState extends State<Home> {

  //Declarations
  final _dataService=DataService();
  final _locationHelper=LocationHelper();
  WeatherResponse _response;
  WeatherResponse _initresponse;
  TextEditingController _textEditingController=TextEditingController();

  //Initial run functions
  void initName() async{
    final lat=await _locationHelper.getCurrentLat();
    final long = await _locationHelper.getCurrentLong();
    _initresponse =await _dataService.getWeatherByCoordinates(lat, long);

    setState((){_response=_initresponse;});
    print(_response.name);
  }
  void initState(){
    initName();
  }

  //Search function
  void _search(city) async{
    final response= await _dataService.getWeather(city);
    print(response.name);
    setState((){
      _response=response;
    });
  }
  @override

  //UI
  Widget build(BuildContext context) {
    return Scaffold(body:
    Column(mainAxisAlignment: MainAxisAlignment.center,children: [
      if(_response!=null)
        if(_response.code == '200')
          Column(children:[
            TextField(controller: _textEditingController,autocorrect: true),
            ElevatedButton(onPressed: (){_search(_textEditingController.text);},child: Text("Search")),
            Text(_response.temp.toString()),
            Text(_response.main),
            Text(_response.name)])
        else
          Column(children:[
            TextField(controller: _textEditingController),
            ElevatedButton(onPressed: (){_search(_textEditingController.text);},child: Text("Search"),),
            Text(''),
            Text(''),
            Text('')])
      else
        loading_screen()

    ])
    );
  }
}



