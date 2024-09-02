// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeatherStateCWProxy {
  WeatherState currentWeatherModel(CurrentWeatherModel? currentWeatherModel);

  WeatherState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    CurrentWeatherModel? currentWeatherModel,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeatherState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeatherState.copyWith.fieldName(...)`
class _$WeatherStateCWProxyImpl implements _$WeatherStateCWProxy {
  const _$WeatherStateCWProxyImpl(this._value);

  final WeatherState _value;

  @override
  WeatherState currentWeatherModel(CurrentWeatherModel? currentWeatherModel) =>
      this(currentWeatherModel: currentWeatherModel);

  @override
  WeatherState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeatherState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeatherState(...).copyWith(id: 12, name: "My name")
  /// ````
  WeatherState call({
    Object? currentWeatherModel = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return WeatherState(
      currentWeatherModel: currentWeatherModel == const $CopyWithPlaceholder()
          ? _value.currentWeatherModel
          // ignore: cast_nullable_to_non_nullable
          : currentWeatherModel as CurrentWeatherModel?,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $WeatherStateCopyWith on WeatherState {
  /// Returns a callable class that can be used as follows: `instanceOfWeatherState.copyWith(...)` or like so:`instanceOfWeatherState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeatherStateCWProxy get copyWith => _$WeatherStateCWProxyImpl(this);
}
