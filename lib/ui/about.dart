import 'package:advanced_flutter/provider/count_provider.dart';
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
