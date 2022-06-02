/*
{
  "coord": {
    "lon": 73.8553,
    "lat": 18.5196
  },
  "weather": [
    {
      "id": 501,
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10n"
    }
  ],
  "main": {
    "temp": 26.27,
    "feels_like": 26.27,
    "temp_min": 26.27,
    "temp_max": 26.27,
    "pressure": 1008,
    "humidity": 68,
    "sea_level": 1008,
    "grnd_level": 947
  },
  "visibility": 10000,
  "wind": {
    "speed": 3.88,
    "deg": 253,
    "gust": 5.58
  },
  "rain": {
    "1h": 1.74
  },
  "clouds": {
    "all": 98
  },
  "dt": 1654107767,
  "sys": {
    "country": "IN",
  },
  "name": "Pune",
  "cod": 200
}
*/

class WeatherResponse{
  final String name;
  final String code;
  final String main;
  final double temp;
  WeatherResponse({this.name,this.code,this.temp,this.main});

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final name=json['name'];
    final code=json['cod'].toString();
    final temp=json['main']['temp'];
    final main=json['weather'][0]['main'];
    return WeatherResponse(name:name,code:code,temp:temp,main: main);
  }

}