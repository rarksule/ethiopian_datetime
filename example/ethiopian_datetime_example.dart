import 'package:ethiopian_datetime/ethiopian_datetime.dart';

void main() {
  
//  Create an instance of ETDateTime with a specific Ethiopian date.
  final myDateTime = ETDateTime(2017, 3, 4);

//  Get the current Ethiopian date and time.
  ETDateTime now = ETDateTime.now();
  print(now); // 2017-03-29 10:19:34.027731

//  Convert the current Ethiopian date and time to the Gregorian calendar.
  DateTime gregorianNow = now.convertToGregorian();
  print(gregorianNow); // 2024-12-08 16:19:34.027731

//  Convert the current Gregorian date and time back to the Ethiopian calendar.
  ETDateTime ethiopianNow = gregorianNow.convertToEthiopian();
  print(ethiopianNow); // 2017-03-29 10:19:34.027731

//  Perform comparisons between Ethiopian date and time objects.
  print(ethiopianNow.isAfter(now)); // false
  print(ethiopianNow.isBefore(now)); // false
  print(ethiopianNow.isAtSameMomentAs(now)); // true
  print(ethiopianNow.compareTo(now)); // 0

//  Perform arithmetic operations on Ethiopian dates.
  final etlater = ethiopianNow.add(Duration(days: 2));
  final etago = ethiopianNow.subtract(Duration(days: 5));
  print(etago); // 2017-03-24 10:19:34.027731
  print(etlater); // 2017-04-01 10:19:34.027731

//  Convert Ethiopian dates to strings using different formats.
  String later = etlater.toString();
  later = etlater.toIso8601String();
  print(later); // 2017-04-01T10:00:00.000

//  Print the current Ethiopian date and time in various date formats.
  print(ETDateFormat("dd-MMMM-yyyy HH:mm:ss")
      .format(now)); // 29-ሕዳር-2017 10:32:21
  print(ETDateFormat.MMMMEEEEd('ti').format(now)); // ሰንበት, ሕዳር 29
  print(ETDateFormat.jms('so').format(now)); // maalin 10:19:34
  print(ETDateFormat.yMMMEd('om').format(now)); // D, Sad 29, 2017

//  Typecast the current system DateTime to ETDateTime.
  ETDateTime typecast = DateTime.now().asETDateTime;

//  Check if two Ethiopian dates fall on the same day.
  ETDateUtils.isSameDay(typecast, myDateTime);

//  Retrieve time of day names used in the Ethiopian calendar.
  print(ETDateUtils.getTimeOfDayNames()); // [ቀን, ማታ, ለሊት, ጠዋት]
}
