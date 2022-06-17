// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'drawer/Apartments.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('HOME PAGE', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/water.png'), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushNamed("/profile");
                    });
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                    ),
                    child: const Center(
                      child: Text(
                        "MY PROFILE ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushNamed("/attendance");
                    });
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.blue[300]),
                    child: const Center(
                      child: Text(
                        "ATTENDANCE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushNamed("/subjects");
                    });
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.blue[400]),
                    child: const Center(
                      child: Text(
                        "SUBJECTS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
