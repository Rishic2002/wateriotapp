// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';

class ApartmentsPage extends StatefulWidget {
  const ApartmentsPage({Key? key}) : super(key: key);

  @override
  State<ApartmentsPage> createState() => _ApartmentsState();
}

class _ApartmentsState extends State<ApartmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text('APARTMENTS', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.blue),
      drawer: MyDrawer(),
    );
  }
}
