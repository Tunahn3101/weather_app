// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/response_model/current_weather_model.dart';
import 'package:weather_app/response_model/wheather_week_model.dart';

part 'weather_state.g.dart';

@CopyWith()
class WeatherState extends Equatable {
  const WeatherState({
    this.currentWeatherModel,
    this.wheatherWeekState,
    this.isLoading = false,
  });

  final CurrentWeatherModel? currentWeatherModel;
  final WheatherWeekModel? wheatherWeekState;
  final bool isLoading;

  @override
  List<Object?> get props =>
      [currentWeatherModel, isLoading, wheatherWeekState];
}
