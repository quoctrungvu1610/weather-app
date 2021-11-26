import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  NetworkHelper({required this.url});
  Uri url;
  Future getData()async{
    // url = Uri.http("api.openweathermap.org","/data/2.5/weather",{"lat":"$latitude","lon":"$longitude","appid":"$apiKey"});
    var response = await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;
     return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }
}