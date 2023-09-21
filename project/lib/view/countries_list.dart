import 'package:flutter/material.dart';
import 'package:project/Sarvices/StateSarvices.dart';
import 'package:project/view/detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  statesarvices StateSarvices = statesarvices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search country',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: StateSarvices.CountriesList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String name = snapshot.data![index]['country'];

                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                name: snapshot.data![index]
                                                    ['country'],
                                                totleCasas: snapshot
                                                    .data![index]['cases'],
                                                totalRecoverd: snapshot
                                                    .data![index]['recovered'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                todayRecoverd:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                name: snapshot.data![index]
                                                    ['country'],
                                                totleCasas: snapshot
                                                    .data![index]['cases'],
                                                totalRecoverd: snapshot
                                                    .data![index]['recovered'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                todayRecoverd:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
