import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/config/constraints.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/model/current_weather_model.dart';
import 'package:weather_app/services/services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherState());

  double? lat;
  double? lon;

  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    lon = position.latitude;

    await getCurrentWeather();
  }

  Future<void> getCurrentWeather() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await Services.getCurrentWeather(
        {
          'lat': lat.toString(),
          'lon': lon.toString(),
          'appid': Constraints.API_KEY,
          'units': 'metric',
        },
      );
      print('response : $response');

      if (response.isNotEmpty) {
        emit(
          state.copyWith(
            currentWeatherModel: CurrentWeatherModel.fromJson(response),
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      rethrow;
    }
  }
}
