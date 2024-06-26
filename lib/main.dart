import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_management/features/activites/workout_plans/provider/new_workout_provider.dart';
import 'package:workout_management/features/activites/workout_plans/provider/workout_list_provider.dart';
import 'package:workout_management/features/splash/splash_screen.dart';
import 'package:workout_management/shared/provider/common_provider.dart';
import 'package:workout_management/shared/utils/navigator.dart';
import 'package:workout_management/shared/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CommonProvider()),
            ChangeNotifierProvider(create: (context) => WorkoutListProvider()),
            ChangeNotifierProvider(create: (context) => NewWorkoutProvider()),
          ],
          child: MaterialApp(
            navigatorKey: AppNavigator.navigatorKey,
            title: 'Workout Manager',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
