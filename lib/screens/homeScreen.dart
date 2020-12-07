import 'package:covidapp/main.dart';
import 'package:covidapp/widgets/futureWidget.dart';
import 'package:flutter/material.dart';

class CovidHome extends StatefulWidget {
  @override
  _CovidHomeState createState() => _CovidHomeState();
}

class _CovidHomeState extends State<CovidHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ));
        },
      ),
    );
  }
}
