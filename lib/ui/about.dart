import 'package:advanced_flutter/ui/home.dart';
import 'package:flutter/material.dart';

import '../data/counting.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text("Go To Home")),
            ],
          ),
        ),
      ),
    );
  }
}
