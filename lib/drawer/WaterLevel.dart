import 'package:flutter/material.dart';

import '../drawer.dart';

class WaterLevelPage extends StatefulWidget {
  @override
  _WaterLevelPageState createState() {
    return _WaterLevelPageState();
  }
}

class _WaterLevelPageState extends State<WaterLevelPage> {
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

/*
class Att {
  final int month;
  final int present;
  final String name;
  Att(this.month, this.present, this.name);

  Att.fromMap(Map<String, dynamic> map)
      : month = map['month'],
        name = map['name'],
        present = map['present'];

  @override
  String toString() => "Record<$name>";
}

class _WaterLevelPageState extends State<WaterLevelPage> {
  late List<charts.Series<Att, int>> _seriesLineData;
  late List<Att> mydata;
  _generateData(mydata) {
    //data being stored
    _seriesLineData = <charts.Series<Att, int>>[];
    _seriesLineData.add(
      charts.Series(
        domainFn: (Att att, _) => att.month,
        measureFn: (Att att, _) => att.present,
        id: 'att',
        data: mydata,
        labelAccessorFn: (Att row, _) => "${row.month}", //xaxis
      ),
    );
  }

  Stream<QuerySnapshot> getGraphSnapshots(BuildContext context) async* {
    yield* FirebaseFirestore.instance
        .collection('abc')
        .doc('UgfpvJNUutktMOm55MpX')
        .collection('attendance')
        .where('month', isLessThanOrEqualTo: 4)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getGraphSnapshots(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Att> att = snapshot.data.docs
              .map((docsSnapshot) => Att.fromMap(docsSnapshot.data()))
              .toList();
          return _buildChart(context, att);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Att> Attdata) {
    mydata = Attdata;
    _generateData(mydata);
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1976d2),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: const Color(0xff9962D0),
              tabs: [
                Tab(
                  text: "9M",
                  icon: new Icon(Icons.bookmark),
                ),
                Tab(
                  icon: new Icon(Icons.bookmark),
                ),
                Tab(
                  icon: new Icon(Icons.bookmark),
                ),
              ],
            ),
            title: const Text('Flutter Charts'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'att BY MONTH',
                          style: const TextStyle(
                              fontSize: 24.0, fontFamily: 'RobotoMono'),
                        ),
                        SizedBox(
                            width: 900,
                            height: 400,
                            child: Card(
                              child: Expanded(
                                child: charts.LineChart(
                                  _seriesLineData,
                                  animate: true,
                                  defaultRenderer:
                                      new charts.LineRendererConfig(
                                          includePoints: true),
                                  //POINTS
                                  animationDuration: const Duration(
                                      seconds: 5), //DURATION OF ANIMATION
                                  behaviors: [
                                    new charts.SeriesLegend(
                                      position: charts.BehaviorPosition.end,
                                      outsideJustification: charts
                                          .OutsideJustification.endDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 2,
                                      cellPadding: new EdgeInsets.only(
                                          right: 4.0, bottom: 4.0),
                                      entryTextStyle:
                                          const charts.TextStyleSpec(
                                              color: const charts.Color(
                                                  r: 127, g: 63, b: 191),
                                              fontFamily: 'Georgia',
                                              fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'att BY MONTH',
                          style: const TextStyle(
                              fontSize: 24.0, fontFamily: 'RobotoMono'),
                        ),
                        SizedBox(
                            width: 900,
                            height: 400,
                            child: Card(
                              child: Expanded(
                                child: charts.LineChart(
                                  _seriesLineData,
                                  animate: true,
                                  defaultRenderer:
                                      new charts.LineRendererConfig(
                                          includePoints: true),
                                  //POINTS
                                  animationDuration: const Duration(
                                      seconds: 5), //DURATION OF ANIMATION
                                  behaviors: [
                                    new charts.SeriesLegend(
                                      position: charts.BehaviorPosition.end,
                                      outsideJustification: charts
                                          .OutsideJustification.endDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 2,
                                      cellPadding: new EdgeInsets.only(
                                          right: 4.0, bottom: 4.0),
                                      entryTextStyle:
                                          const charts.TextStyleSpec(
                                              color: const charts.Color(
                                                  r: 127, g: 63, b: 191),
                                              fontFamily: 'Georgia',
                                              fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'att BY MONTH',
                          style: TextStyle(
                              fontSize: 24.0, fontFamily: 'RobotoMono'),
                        ),
                        SizedBox(
                            width: 900,
                            height: 400,
                            child: Card(
                              child: Expanded(
                                child: charts.LineChart(
                                  _seriesLineData,
                                  animate: true,
                                  defaultRenderer:
                                      new charts.LineRendererConfig(
                                          includePoints: true),
                                  //POINTS
                                  animationDuration: const Duration(
                                      seconds: 5), //DURATION OF ANIMATION
                                  behaviors: [
                                    new charts.SeriesLegend(
                                      position: charts.BehaviorPosition.end,
                                      outsideJustification: charts
                                          .OutsideJustification.endDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 2,
                                      cellPadding: new EdgeInsets.only(
                                          right: 4.0, bottom: 4.0),
                                      entryTextStyle:
                                          const charts.TextStyleSpec(
                                              color: charts.Color(
                                                  r: 127, g: 63, b: 191),
                                              fontFamily: 'Georgia',
                                              fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/