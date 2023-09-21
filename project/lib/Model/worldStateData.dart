class WorldStateData {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldStateData(
      {this.updated,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion,
      this.affectedCountries});

  WorldStateData.fromJson(Map<String, dynamic> json) {
    updated = json["updated"];
    cases = json["cases"];
    todayCases = json["todayCases"];
    deaths = json["deaths"];
    todayDeaths = json["todayDeaths"];
    recovered = json["recovered"];
    todayRecovered = json["todayRecovered"];
    active = json["active"];
    critical = json["critical"];
    casesPerOneMillion = json["casesPerOneMillion"];
    deathsPerOneMillion = json["deathsPerOneMillion"];
    tests = json["tests"];
    testsPerOneMillion = json["testsPerOneMillion"];
    population = json["population"];
    oneCasePerPeople = json["oneCasePerPeople"];
    oneDeathPerPeople = json["oneDeathPerPeople"];
    oneTestPerPeople = json["oneTestPerPeople"];
    activePerOneMillion = json["activePerOneMillion"];
    recoveredPerOneMillion = json["recoveredPerOneMillion"];
    criticalPerOneMillion = json["criticalPerOneMillion"];
    affectedCountries = json["affectedCountries"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["updated"] = updated;
    _data["cases"] = cases;
    _data["todayCases"] = todayCases;
    _data["deaths"] = deaths;
    _data["todayDeaths"] = todayDeaths;
    _data["recovered"] = recovered;
    _data["todayRecovered"] = todayRecovered;
    _data["active"] = active;
    _data["critical"] = critical;
    _data["casesPerOneMillion"] = casesPerOneMillion;
    _data["deathsPerOneMillion"] = deathsPerOneMillion;
    _data["tests"] = tests;
    _data["testsPerOneMillion"] = testsPerOneMillion;
    _data["population"] = population;
    _data["oneCasePerPeople"] = oneCasePerPeople;
    _data["oneDeathPerPeople"] = oneDeathPerPeople;
    _data["oneTestPerPeople"] = oneTestPerPeople;
    _data["activePerOneMillion"] = activePerOneMillion;
    _data["recoveredPerOneMillion"] = recoveredPerOneMillion;
    _data["criticalPerOneMillion"] = criticalPerOneMillion;
    _data["affectedCountries"] = affectedCountries;
    return _data;
  }
}
