import 'dart:async';

import 'package:diam/shared/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  int _selectedIndex = 0;
  //List<ChartData> _chartData = [];
  late List<ChartData> chartData;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    chartData = [
      ChartData(DateTime(2022, 01, 01, 09, 12), 80),
      ChartData(DateTime(2022, 02, 02, 09, 13), 45),
      ChartData(DateTime(2022, 03, 03, 09, 14), 90),
      ChartData(DateTime(2022, 04, 04, 09, 15), 51),
      ChartData(DateTime(2022, 05, 10, 09, 01), 90),
      ChartData(DateTime(2022, 06, 06, 09, 16), 41),
      ChartData(DateTime(2022, 07, 06, 09, 16), 90),
      ChartData(DateTime(2022, 07, 06, 09, 16), 40),
      ChartData(DateTime(2022, 07, 10, 09, 16), 90),
      ChartData(DateTime(2022, 07, 11, 09, 16), 40),
      ChartData(DateTime(2022, 07, 12, 09, 16), 50),
      ChartData(DateTime(2022, 07, 15, 09, 16), 60),
      ChartData(DateTime(2022, 07, 20, 09, 16), 70),
    ];
    super.initState();
    _selectedIndex = _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/DIAMWEBMOBILE1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    tooltip: 'retour',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Center(
                    child: Column(
                      children: [
                        Text('Quittances',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        Text('89293.16 MAD',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SfCartesianChart(
                    enableAxisAnimation: true,
                    trackballBehavior: TrackballBehavior(
                        enable: true,
                        markerSettings: const TrackballMarkerSettings(
                            height: 10,
                            width: 10,
                            markerVisibility: TrackballVisibilityMode.visible,
                            borderColor: Colors.black,
                            borderWidth: 4,
                            color: Colors.blue),
                        activationMode: ActivationMode.singleTap,
                        builder: (context, trackballDetails) {
                          return SizedBox(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${trackballDetails.groupingModeInfo!.points[0].y}%",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 5)),
                                Text(
                                  DateFormat('hh:mm').format(trackballDetails
                                      .groupingModeInfo!.points[0].x),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                        tooltipAlignment: ChartAlignment.near),
                    plotAreaBorderWidth: 0, // X top line
                    plotAreaBorderColor: Colors.white24,
                    primaryXAxis: DateTimeAxis(
                      // Interval type will be months
                      intervalType: DateTimeIntervalType.days,
                      interval: 15,
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      labelRotation: 90,
                      majorTickLines: const MajorTickLines(
                          width: 0), // Little sticks below X line
                      majorGridLines: const MajorGridLines(
                        width: 0.5,
                        color: Colors.transparent,
                      ),
                      axisLine: const AxisLine(
                          // X bottom line
                          color: Colors.white24,
                          dashArray: <double>[5, 5]),
                    ),
                    primaryYAxis: NumericAxis(
                      interval: 20,
                      majorGridLines: const MajorGridLines(
                          width: 1,
                          color: Colors.white24,
                          dashArray: <double>[5, 5]),
                      majorTickLines: const MajorTickLines(
                          width: 0), // Little sticks on left side
                      axisLine: const AxisLine(
                          color: Colors.transparent, // Y left line
                          dashArray: <double>[5, 5]),
                      minimum: 0,
                      maximum: 100,
                    ),
                    series: <ChartSeries<ChartData, DateTime>>[
                      AreaSeries(
                          borderColor: Colors.blue,
                          borderWidth: 3,
                          gradient: LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.4),
                                Colors.blue.withOpacity(0.2),
                                Colors.blue.withOpacity(0.1)
                              ],
                              stops: const [
                                0.1,
                                0.3,
                                0.6
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void _getTime() {
    if (!mounted) return;
    setState(() {
    });
  }

}

class ChartData {
  final DateTime x;
  final num y;

  ChartData(this.x, this.y);
}
