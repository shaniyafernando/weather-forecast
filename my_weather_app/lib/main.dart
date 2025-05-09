import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/presentation/cubits/theme_cubit.dart';
import 'package:my_weather_app/presentation/pages/current_weather_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(BlocProvider(create: (context) => ThemeCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness:
              context.watch<ThemeCubit>().isDark()
                  ? Brightness.dark
                  : Brightness.light,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.merriweather() ,
          displaySmall: GoogleFonts.merriweather() ,
          bodyLarge: GoogleFonts.roboto(),
        ),
      ),
      home: CurrentWeatherPage(),
    );
  }
}
