import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String API_BASE_URL = '${dotenv.env['API_BASE_URL']}';
  static String API_KEY = '${dotenv.env['API_KEY']}';
  static String API_PREFIX = '${dotenv.env['API_PREFIX']}';
}
