import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    weatherCubit = context.read<WeatherCubit>();
    weatherCubit.getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    void showModalNotification() {
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
                Row(
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
                      onTap: () {
                        showModalNotification();
                      },
                      child: Image.asset(
                        AppImages.icNotificationBell,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Image.asset(
                  AppImages.icSunCloudss,
                  width: 169,
                  height: 172,
                ),
                const SizedBox(height: 34),
                Container(
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
                      const Text(
                        'Today, 12 September',
                        style: TextStyle(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(AppImages.icWindy),
                          const SizedBox(width: 20),
                          const Text(
                            'Wind',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
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
                          const Text(
                            '10 km/h',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(AppImages.icHum),
                          const SizedBox(width: 20),
                          const Text(
                            'Hum',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
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
                            '${state.currentWeatherModel?.main?.humidity.toString()} %',
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 220,
                    height: 64,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 27),
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
                        Image.asset('assets/images/up.png')
                      ],
                    )),
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          );
        },
      ),
    );
  }
}
