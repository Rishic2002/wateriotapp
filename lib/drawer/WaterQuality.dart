// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';

class WaterQualityPage extends StatefulWidget {
  const WaterQualityPage({Key? key}) : super(key: key);

  @override
  State<WaterQualityPage> createState() => _ApartmentsState();
}

class _ApartmentsState extends State<WaterQualityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('ATTENDANCE REPORTS',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.blue),
      drawer: MyDrawer(),
    );
  }
}
