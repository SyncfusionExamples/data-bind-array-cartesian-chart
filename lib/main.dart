import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = <_SalesData>[];
  List<int> xValues = [1, 2, 3, 4, 5];
  List<int> yValues = [35, 28, 34, 32, 40];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    for (int i = 0; i < xValues.length; i++) {
      data.add(_SalesData(xValues[i], yValues[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Center(
        child:
            //Initialize the chart widget
            SfCartesianChart(
                // Chart title
                title: ChartTitle(text: 'Bind the array data to the chart'),
                primaryYAxis: NumericAxis(
                  minimum: 20,
                ),
                series: <ChartSeries<_SalesData, int>>[
              LineSeries<_SalesData, int>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.xValue,
                  yValueMapper: (_SalesData sales, _) => sales.yValue,
                  name: 'Sales')
            ]),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.xValue, this.yValue);

  final int xValue;
  final int yValue;
}
