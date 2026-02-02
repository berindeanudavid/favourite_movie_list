import 'package:flutter/material.dart';
import 'screens/movie_list_screen.dart';
import 'common/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: base.copyWith(
        colorScheme: base.colorScheme.copyWith(primary: Colors.red),
        primaryColor: Colors.red,
        scaffoldBackgroundColor: const Color.fromARGB(255, 102, 6, 6),
        cardColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 1,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: base.textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: MovieListScreen(),
    );
  }
}
