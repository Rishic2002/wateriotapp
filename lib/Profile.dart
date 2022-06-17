// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _dobController = TextEditingController();

addData() {
  Map<String, dynamic> data = {
    "name": _nameController.text,
    "email": _emailController.text,
    "phone_number": _phoneController.text,
    "DOB": _dobController.text
  };
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('student');
  collectionReference.add(data);
}

fetchData() {
  // ignore: unused_local_variable
  Map<String, dynamic>? data = {
    "name": _nameController.text,
    "email": _emailController.text,
    "phone_number": _phoneController.text,
    "DOB": _dobController.text
  };
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('student');
  collectionReference.snapshots().listen((snapshot) {
    // ignore: unused_element
    setState() {
      data = snapshot.docs[0].data() as Map<String, dynamic>?;
    }
  });
}

updateData() async {
  Map<String, dynamic> data = {
    "name": _nameController.text,
    "email": _emailController.text,
    "phone_number": _phoneController.text,
    "DOB": _dobController.text
  };
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('student');
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs[0].reference.update(data);
}

deleteData() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('student');
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs[0].reference.delete();
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('STUDENT PROFILE',
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.blue),
        body: Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 0),
                child: Flexible(
                  child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'NAME',
                      )),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: Flexible(
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'EMAIL ID',
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: Flexible(
                  child: TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'MOBILE NUMBER',
                      )),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: Flexible(
                  child: TextField(
                      controller: _dobController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'DATE-OF-BIRTH',
                        hintText: 'Enter in DD/MM/YYYY format',
                      )),
                )),
            const SizedBox(
              height: 15,
            ),
            Column(children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0), //button
                width: 150,
                child: MaterialButton(
                    elevation: 5.0,
                    onPressed: () {
                      setState(() {
                        addData();
                      });
                    },
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0), //text
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.blue,
                    child: const Expanded(
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                        ),
                      ),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                width: 150,
                child: MaterialButton(
                    elevation: 5.0,
                    onPressed: () {
                      setState(() {
                        updateData();
                      });
                    },
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 0, bottom: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.blue,
                    child: const Flexible(
                      child: Text(
                        'UPDATE',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                        ),
                      ),
                    )),
              ),
            ]),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 0),
                  width: 150,
                  child: MaterialButton(
                      elevation: 5.0,
                      onPressed: () {
                        setState(() {
                          deleteData();
                        });
                      },
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 0, bottom: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.blue,
                      child: const Flexible(
                        child: Text(
                          'DELETE',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                          ),
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 0),
                  width: 150,
                  child: MaterialButton(
                      elevation: 5.0,
                      onPressed: () {
                        setState(() {
                          deleteData();
                        });
                      },
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 0, bottom: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.blue,
                      child: const Flexible(
                        child: Text(
                          'FETCH',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                          ),
                        ),
                      )),
                )
              ],
            )
          ])),
        ));
  }
}
