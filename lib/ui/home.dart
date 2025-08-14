import 'package:flutter/material.dart';

import '../data/counting.dart';
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
            children: [
              Text("Counter is $number"),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  number++;
                  setState(() {});
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
