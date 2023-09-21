import 'package:flutter/material.dart';
import 'package:project/view/worldstatescreen.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totleCasas,
      totalDeaths,
      totalRecoverd,
      active,
      critical,
      test,
      todayRecoverd;
  DetailScreen({
    required this.image,
    required this.name,
    required this.totleCasas,
    required this.totalDeaths,
    required this.totalRecoverd,
    required this.active,
    required this.critical,
    required this.test,
    required this.todayRecoverd,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ReuseableRow(
                            title: 'cases',
                            value: widget.totleCasas.toString()),
                        ReuseableRow(
                            title: 'deaths',
                            value: widget.totalDeaths.toString()),
                        ReuseableRow(
                            title: 'recoverd',
                            value: widget.totalRecoverd.toString()),
                        ReuseableRow(
                            title: 'active', value: widget.active.toString()),
                        ReuseableRow(
                            title: 'critical',
                            value: widget.critical.toString()),
                        ReuseableRow(
                            title: 'test', value: widget.test.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
