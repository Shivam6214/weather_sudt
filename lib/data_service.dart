import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class DataService{

  Future<WeatherResponse> getWeather(String city) async{
    final queryParams={'q':city,'apiKey':'9baf7136306f0602cb0d39b7bbb23b00','units':'metric'};
    final uri=Uri.http('api.openweathermap.org','/data/2.5/weather',queryParams);
    final response=await http.get(uri);
    print(response.body);

    if((jsonDecode(response.body))['cod']==200) {
      return WeatherResponse.fromJson(jsonDecode(response.body));
    }
    else if((jsonDecode(response.body))['cod']=="400") {
      return WeatherResponse.fromJson({'name':'','cod':12});
    }
    else if((jsonDecode(response.body))['cod'].toString()=="404"){
      return WeatherResponse.fromJson({'name':'','cod':12});
    }
    else {
      return WeatherResponse.fromJson({'name':'server side error','cod':12});
    }
  }

  Future<WeatherResponse> getWeatherByCoordinates(double lat,double lon) async{
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

//  final queryParams={'lat':22,'lon':23,'apiKey':'9baf7136306f0602cb0d39b7bbb23b00','units':'metric'};
    final uri=Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=9baf7136306f0602cb0d39b7bbb23b00&units=metric');
    final response=await http.get(uri);
    print(response.body);

    return WeatherResponse.fromJson(jsonDecode(response.body));

  }


}
