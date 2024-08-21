import 'package:bloc/bloc.dart';
import 'package:weather_app/core/config/constraints.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/services/services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherState());

  Future<void> getCurrentWeather() async {
    try {
      final response = await Services.getCurrentWeather(
        {
          'lat': '44.34',
          'lon': '10.99',
          'appid': Constraints.API_KEY,
          'units': 'metric',
        },
      );
      print('response : $response');

      if (response.isNotEmpty) {
        emit(
          state.copyWith(
            currentWeatherModel: CurrentWeatherModel.fromJson(response),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
