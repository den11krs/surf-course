import 'package:task_1/map_before_2010.dart';
import 'package:task_1/map_after_2010.dart';
import 'package:task_1/calculate_average_ages.dart';

void main() {
  List<Map> incomingData = [mapBefore2010, mapAfter2010];

  final List<num> averageAges = calculateAverageAges(incomingData);

  print(
      'Средний возраст всей техники равен ${averageAges[0].toStringAsFixed(2)}.');
  print(
      'Средний возраст 50% самой старой техники равен ${averageAges[1].toStringAsFixed(2)}.');
}
