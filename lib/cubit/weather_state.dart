import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/model/current_weather_model.dart';

part 'weather_state.g.dart';

@CopyWith()
class WeatherState extends Equatable {
  const WeatherState({
    this.currentWeatherModel,
    this.isLoading = false,
  });

  final CurrentWeatherModel? currentWeatherModel;
  final bool isLoading;

  @override
  List<Object?> get props => [currentWeatherModel, isLoading];
}
