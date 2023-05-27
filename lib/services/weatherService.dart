import 'package:http/http.dart' as http;
import 'package:weather_app/common/constants.dart';

class WeatherService {
  var client = http.Client();
  String endpoint = Constants.API_BASE_URL;
  String apiKey = Constants.API_KEY;

  Map<String, dynamic> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Accept": "application/json"
  };
}
