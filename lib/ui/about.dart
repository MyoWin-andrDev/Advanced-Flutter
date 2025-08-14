import 'package:advanced_flutter/provider/count_provider.dart';
import 'package:advanced_flutter/provider/theme_provider.dart';
import 'package:advanced_flutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/counting.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    // Watch the current brightness (not needed as a variable unless used elsewhere)
    final themeProvider = context.watch<ThemeProvider>();
    final currentBrightness = themeProvider.brightness;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About Page"),
          backgroundColor: Colors.amberAccent,
          actions: [
            IconButton(
              onPressed: () {
                // Toggle brightness to the opposite value
                themeProvider.setBrightness(
                  currentBrightness == Brightness.light
                      ? Brightness.dark
                      : Brightness.light,
                );
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Counter is ${context.watch<CountProvider>().count}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    context.read<CountProvider>().increaseCount();
                  });
                },
                child: const Text("Increase"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Pop back to Home page
                },
                child: const Text("Go To Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}