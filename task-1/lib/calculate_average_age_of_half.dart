import 'data_model.dart';

// Посчитать средний возраст 50% самой старой техники
num calculateAverageAgeOfHalf(List incomingData) {
  num sumOfAges = 0;
  num halfListLength = 0;
  num averageAgeOfHalf = 0;

  // print('Для начала создадим список всех машин из всех стран и территорий.');
  // print('');

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
  final int numberOfItems = machineryInventory.length;

  if (numberOfItems == 0) {
    print('У нас совсем нет машин...');
  } else {
    // print('Всего машин в парке $numberOfItems.');

    // print('');
    // print(
    //     'Теперь отсортируем все машины в списке по возрасту от самой старой до самой новой.');
    // print('');

    machineryInventory
        .sort(((a, b) => a.releaseDate.year.compareTo(b.releaseDate.year)));

    if (numberOfItems % 2 == 0) {
      // print('Длинна списка - чётная. Она равна ${machineryInventory.length}.');

      for (var i = 0; i < machineryInventory.length / 2; i++) {
        int age = (DateTime.now().year - machineryInventory[i].releaseDate.year)
            .toInt();

        // print(
        //     'Прибавим возраст ${machineryInventory[i].id} равный $age к общему числу $sumOfAges.');
        sumOfAges += age;
        // print('Сейчас сумма всех возрастов такая: $sumOfAges.');

        halfListLength = machineryInventory.length / 2;
      }
    } else if (numberOfItems % 2 == 1) {
      // print(
      //     'Длинна списка - нечётная. Она равна ${machineryInventory.length}.');

      for (var i = 0; i < (machineryInventory.length / 2) - 1; i++) {
        int age = (DateTime.now().year - machineryInventory[i].releaseDate.year)
            .toInt();

        // print(
        //     'Прибавим возраст ${machineryInventory[i].id} равный $age к общему числу $sumOfAges.');
        sumOfAges += age;
      }

      // print('Сейчас сумма всех возрастов такая: $sumOfAges.');
      // print('');
      // print(
      //     'Теперь я хочу добавить к этой сумме половину возраста машины в середине списка.');
      // print('Вот это машина:');
      // print(machineryInventory[(machineryInventory.length ~/ 2)].id);
      // print(
      //     'Её возраст: ${DateTime.now().year - machineryInventory[(machineryInventory.length ~/ 2)].releaseDate.year}');

      // Вычисляем половину возраста машины из середины списка машин.
      num ageMiddleMachinery = (DateTime.now().year -
              machineryInventory[(machineryInventory.length ~/ 2)]
                  .releaseDate
                  .year) /
          2;

      sumOfAges = sumOfAges + ageMiddleMachinery;

      // print(
      //     'Прибавили $ageMiddleMachinery. Теперь сумма всех возрастов такая: $sumOfAges.');

      halfListLength = machineryInventory.length / 2;
    }

    averageAgeOfHalf = sumOfAges / halfListLength;
  }

  return averageAgeOfHalf;
}
