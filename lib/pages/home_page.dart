import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/config/app_color.dart';
import 'package:weather_app/core/config/app_images.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherCubit weatherCubit;

  @override
  void initState() {
    super.initState();
    weatherCubit = context.read<WeatherCubit>();
    weatherCubit.getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.appBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 52),
                _buildHeader(),
                const SizedBox(height: 50),
                _buildWeatherIcon(),
                const SizedBox(height: 34),
                state.isLoading || state.currentWeatherModel == null
                    ? _buildLoadingIndicator()
                    : _buildWeatherDetail(state),
                const Spacer(),
                _buildForecastReportButton(),
                const SizedBox(height: 36),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(AppImages.icMap),
            const SizedBox(width: 20),
            const Text(
              'Semarang',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 15),
            Image.asset(AppImages.icOpt),
          ],
        ),
        GestureDetector(
          onTap: () => showModalNotification(),
          child: Image.asset(AppImages.icNotificationBell),
        ),
      ],
    );
  }

  Widget _buildWeatherIcon() {
    return Image.asset(
      AppImages.icSunCloudss,
      width: 169,
      height: 172,
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      width: 353,
      height: 335,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildWeatherDetail(WeatherState state) {
    DateTime dateTime = DateTime.now();

    String currentDay = DateFormat('EEEE, dd MMMM yyyy').format(dateTime);
    return Container(
      width: 353,
      height: 335,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade700,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text(
            currentDay,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            ' ${state.currentWeatherModel?.main?.temp!.ceil().toString()}°',
            style: const TextStyle(
              fontSize: 100,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Cloudy',
            style: TextStyle(
              fontSize: 24,
              color: AppColors.white,
            ),
          ),
          _buildWeatherStatsRow(
            icon: AppImages.icWindy,
            label: 'Wind',
            value: '${state.currentWeatherModel?.wind!.speed!.ceil()} km/h',
          ),
          const SizedBox(height: 10),
          _buildWeatherStatsRow(
            icon: AppImages.icHum,
            label: 'Hum',
            value: '${state.currentWeatherModel?.main?.humidity.toString()} %',
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherStatsRow({
    required String icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(icon),
        const SizedBox(width: 20),
        SizedBox(
          width: 46,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: 23),
        const Text(
          '|',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildForecastReportButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 220,
        height: 64,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 27),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blue),
        ),
        child: Center(
          child: Row(
            children: [
              const Text(
                'Forecast report',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Image.asset('assets/images/up.png'),
            ],
          ),
        ),
      ),
    );
  }

  void showModalNotification() {
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      barrierColor: Colors.white.withOpacity(0.5),
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: screenHeight / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 19),
              Container(
                width: 40,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  textAlign: TextAlign.start,
                  'Your Notification',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
