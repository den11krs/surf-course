import 'package:task_1/map_before_2010.dart';
import 'package:task_1/map_after_2010.dart';
import 'package:task_1/calculate_average_age.dart';
import 'package:task_1/calculate_average_age_of_half.dart';

void main() {
  List<Map> incomingData = [mapBefore2010, mapAfter2010];

  num averageAge = calculateAverageAge(incomingData);
  print('Средний возраст всей техники равен ${averageAge.toStringAsFixed(2)}.');
  print('');

  num averageAgeOfHalf = calculateAverageAgeOfHalf(incomingData);
  print(
      'Средний возраст 50% самой старой техники равен ${averageAgeOfHalf.toStringAsFixed(2)}.');
}
