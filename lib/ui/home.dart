import 'package:advanced_flutter/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/counting.dart';
import 'about.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var number = Counting.value;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Counter is ${context.watch<CountProvider>().count}"),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    context.read<CountProvider>().increaseCount();
                  });
                },
                child: Text("Increase"),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                  },
                  child: Text("Go To About")),
            ],
          ),
        ),
      ),
    );
  }
}
