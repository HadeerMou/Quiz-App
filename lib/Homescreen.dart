import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: 
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 2,),
                Text("Let's start Quiz", style: Theme.of(context).textTheme.headlineMedium),
                Text("Enter your Name below"),
                Spacer(),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    )
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20.0* 0.75),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text("Let's Start Quiz",style: Theme.of(context).textTheme.labelLarge),
                  ),
                ),
                Spacer(flex: 2,),
              ],
            ),),),

        ]),
    );
  }
}