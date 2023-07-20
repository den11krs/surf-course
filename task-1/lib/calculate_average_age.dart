import 'data_model.dart';

// Посчитать средний возраст всей техники
calculateAverageAge(List incomingData) {
  Set<AgriculturalMachinery> machineryInventory = {};
  int sumOfAges = 0;
  num averageAge = 0;

  // print('Посчитаем средний возраст всей техники.');
  // print('Для этого проведём инвентаризацию. Посмотрим, что у нас есть: ');
  // print('');

  for (final map in incomingData) {
    for (final key in map.keys) {
      for (final territory in map[key]) {
        for (final machinery in territory.machineries) {
          // print('Название машины: ${machinery.id}');
          // print(
          //     'Возраст машины: ${(DateTime.now().year - machinery.releaseDate.year)}');

          // Тут нужно проверить, есть ли эта машина в Set machineryInventory
          if (!machineryInventory.contains(machinery)) {
            machineryInventory.add(machinery);

            int age =
                (DateTime.now().year - machinery.releaseDate.year).toInt();

            // print(
            //     'Прибавим возраст ${machinery.id} равный $age к общему числу $sumOfAges.');
            sumOfAges += age;
            // print('Получаем суммарный возраст всех машин равный $sumOfAges.');
            // print('');
          } else {
            // print(
            //     'Машина ${machinery.id} уже есть в списке. Её возвраст уже учтён в общем возрасте парка машин.');
            // print('');
          }
        }
      }
    }
  }

  final int numberOfItems = machineryInventory.length;

  if (numberOfItems == 0) {
    print('У нас совсем нет машин...');
  } else {
    print('Всего машин в парке $numberOfItems машин.');
    averageAge = sumOfAges / numberOfItems;
  }

  return averageAge;
}
