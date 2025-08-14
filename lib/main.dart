import 'package:advanced_flutter/provider/count_provider.dart';
import 'package:advanced_flutter/provider/theme_provider.dart';
import 'package:advanced_flutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
          darkTheme: ThemeData(primarySwatch: Colors.amber, brightness: Brightness.dark),
          themeMode: themeProvider.brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light, // Dynamically set based on ThemeProvider
          home: Home(),
        );
      },
    );
  }
}