import 'data_model.dart';

List<num> calculateAverageAges(List incomingData) {
  List<num> result = [];

  List<AgriculturalMachinery> machineryInventory = [];

  for (final map in incomingData) {
    for (final key in map.keys) {
      for (final territory in map[key]) {
        for (final machinery in territory.machineries) {
          if (!machineryInventory.contains(machinery)) {
            machineryInventory.add(machinery);
          } else {}
        }
      }
    }
  }

  num sumOfAges = getSumOfAges(machineryInventory);

  num averageAge = sumOfAges / machineryInventory.length;

  result.add(averageAge);

  // The second part of calculations

  machineryInventory
      .sort(((a, b) => a.releaseDate.year.compareTo(b.releaseDate.year)));

  List halfOfMachineryInventory =
      machineryInventory.sublist(0, (machineryInventory.length ~/ 2));

  num sumOfAgesOfHalf = getSumOfAges(halfOfMachineryInventory);

  num averageAgeOfHalf = sumOfAgesOfHalf / halfOfMachineryInventory.length;

  result.add(averageAgeOfHalf);

  return result;
}

num getSumOfAges(List machineryInventory) {
  num sumOfAges = 0;

  for (var machinery in machineryInventory) {
    int age = (DateTime.now().year - machinery.releaseDate.year).toInt();
    sumOfAges += age;
  }

  return sumOfAges;
}
