import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:project/Model/worldStateData.dart';
import 'package:project/Sarvices/StateSarvices.dart';
import 'package:project/view/countries_list.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({super.key});

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen> {
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xffe17055),
  ];
  @override
  Widget build(BuildContext context) {
    statesarvices stateSarvices = statesarvices();
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: stateSarvices.fatchWorldStateRecord(),
              builder: (context, AsyncSnapshot<WorldStateData> snapshot) {
                if (!snapshot.hasData) {
                  return const Expanded(
                      flex: 1,
                      child: SpinKitChasingDots(
                        size: 30,
                        color: Colors.white,
                      ));
                } else {
                  return Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: PieChart(
                            dataMap: {
                              "Total":
                                  double.parse(snapshot.data!.cases.toString()),
                              "Recoverd": double.parse(
                                  snapshot.data!.recovered.toString()),
                              "Death": double.parse(
                                  snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.05),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Card(
                            child: Column(
                              children: [
                                ReuseableRow(
                                    title: 'cases',
                                    value: snapshot.data!.cases.toString()),
                                ReuseableRow(
                                    title: 'deaths',
                                    value: snapshot.data!.deaths.toString()),
                                ReuseableRow(
                                    title: 'recoverd',
                                    value: snapshot.data!.recovered.toString()),
                                ReuseableRow(
                                    title: 'active',
                                    value: snapshot.data!.active.toString()),
                                ReuseableRow(
                                    title: 'critical',
                                    value: snapshot.data!.critical.toString()),
                                ReuseableRow(
                                    title: 'todayDeaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                                ReuseableRow(
                                    title: 'todayRecoverd',
                                    value: snapshot.data!.todayRecovered
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (Context) => CountriesList()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(child: Text('Track countries')),
                        ),
                      )
                    ],
                  );
                }
              }),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Divider(),
        ],
      ),
    );
  }
}
