import 'package:weather_app/core/net_work/api_service.dart';

class Services {
  Services._();

  static Future<Map<String, dynamic>> getCurrentWeather(
      Map<String, dynamic> param) async {
    try {
      final response = await APIService.instance.request(
        '/data/2.5/weather',
        DioMethod.get,
        param: param,
      );

      return response.data;
    } catch (e) {
      return {};
    }
  }
}
