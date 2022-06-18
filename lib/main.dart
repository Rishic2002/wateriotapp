// ignore_for_file: duplicate_import, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'drawer/AddApartments.dart';
import 'drawer/Apartments.dart';
import 'drawer/Powerconsumption.dart';
import 'drawer/WaterLevel.dart';
import 'drawer/WaterQuality.dart';
import 'drawer/backupRestore.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'home.dart';
import 'profile.dart';
import 'signup.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const LoginPage(title: 'Student App'),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => const SignupPage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        '/home': (BuildContext context) => const HomePage(),
        '/Apartments': (BuildContext context) => const ApartmentsPage(),
        '/PowerConsumption': (BuildContext context) =>
            const PowerConsumptionPage(),
        '/WaterLevel': (BuildContext context) => WaterLevelPage(),
        '/addApartments': (BuildContext context) => const AddApartmentsPage(),
        '/backupRestore': (BuildContext context) => const BackupRestorePage(),
        '/WaterQuality': (BuildContext context) => const WaterQualityPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _success = 1;
  String _userEmail = "";

  void _singIn() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _success = 2;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Assets/water.png'), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 350, //gap
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 120, left: 20, right: 30),
                  child: const Text(
                    "WELCOME!",
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                (TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "EMAIL",
                    hintText: 'ENTER YOUR EMAIL AS ABC@XYZ.COM',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.black),
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "PASSWORD",
                    hintText: "ENTER YOUR PASSWORD",
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.black),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text(
                          "FORGOT YOUR PASSWORD? CLICK HERE",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ]),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _success == 1
                          ? ''
                          : (_success == 2
                              ? 'Successfully signed in ' + _userEmail
                              : 'Sign in failed'),
                      style: const TextStyle(color: Colors.blue),
                    )),
                const SizedBox(
                  height: 40,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                    elevation: 7,
                    child: MaterialButton(
                      onPressed: () {
                        _singIn();
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: const Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}

Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
    width: size.width * 0.8,
    child: Row(
      children: <Widget>[
        buildDivider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        buildDivider(),
      ],
    ),
  );
}

Expanded buildDivider() {
  return const Expanded(
    child: Divider(
      color: Color(0xFFD9D9D9),
      height: 1.5,
    ),
  );
}
