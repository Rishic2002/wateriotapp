// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../drawer.dart';

class PowerConsumptionPage extends StatefulWidget {
  const PowerConsumptionPage({Key? key}) : super(key: key);

  @override
  State<PowerConsumptionPage> createState() => _ApartmentsState();
}

class _ApartmentsState extends State<PowerConsumptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('CLASS REPORTS',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.blue),
      drawer: MyDrawer(),
    );
  }
}
