import 'package:example/model/chart_data.dart';
import 'package:example/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'first app',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ChartData> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = [
      ChartData(17, 21500),
      ChartData(18, 22684),
      ChartData(19, 21643),
      ChartData(20, 22997),
      ChartData(21, 22883),
      ChartData(22, 22635),
      ChartData(23, 21800),
      ChartData(24, 23500),
      ChartData(25, 21354),
      ChartData(26, 22354),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bg_color,
      appBar: AppBar(
        backgroundColor: AppStyle.bg_color,
        elevation: 0,
        title: Text("Bitcoin Price"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "BITCOIN",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),

          SizedBox(
            height: 10.0,
          ),

          CircleAvatar(
            backgroundImage:
                NetworkImage("https://coinicons-api.vercel.app/api/icon/btc"),
            radius: 28.0,
          ),

          SizedBox(
            height: 10.0,
          ),
          Text(
            "BTC",
            style: TextStyle(fontSize: 24.0, color: Colors.white12),
          ),

          //now let's start adding the chart
          Center(
            child: SfCartesianChart(
              margin: EdgeInsets.all(5),
              borderWidth: 0,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                minimum: 17, //let's take the minimum value of our list
                maximum: 26, //let's take the maximum value of our list
                isVisible: false,
                interval: 1,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: NumericAxis(
                minimum: 19000,
                maximum: 24000,
                interval: 1000,
                isVisible: false,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              series: <ChartSeries<ChartData, int>>[
                SplineAreaSeries(
                    dataSource: data,
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.price,
                    splineType: SplineType.natural,
                    gradient: LinearGradient(
                      colors: [
                        AppStyle.spline_color,
                        AppStyle.bg_color.withAlpha(150),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                SplineSeries(
                  dataSource: data,
                  color: AppStyle.accent_color,
                  width: 4,
                  markerSettings: MarkerSettings(
                    color: Colors.white,
                    borderWidth: 2,
                    shape: DataMarkerType.circle,
                    isVisible: true,
                    borderColor: AppStyle.accent_color,
                  ),
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                )
              ],
            ),
          ),

          SizedBox(
            height: 40.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(16.0),
                    side: BorderSide(
                      color: AppStyle.accent_color,
                    )),
                icon: Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
                label: Text(
                  "Sell",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),


              TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(16.0),
                    side: BorderSide(
                      color: AppStyle.accent_color
                    )
                  ),
                  icon: Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Buy",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

//let's start by adding sfcharts dependencies
