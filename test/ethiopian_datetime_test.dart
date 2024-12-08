// import 'package:ethiopian_datetime/ethiopian_datetime.dart';
// import 'package:test/test.dart';

// void main() {
//   group('Date Converter Tests', () {
//     test('Test Ethiopian to Gregorian to Ethiopian for the year 2021 to 2024',
//         () {
//       int testsrun = 0;
//       for (int year = 2021; year <= 2024; year++) {
//         for (int month = 1; month <= 12; month++) {
//           for (int day = 1; day <= 30; day++) {
//             for (int hour = 0; hour <= 23; hour++) {
//               final gregorianDate = DateTime(year, month, day,
//                   hour); //date is equal after morning 6am if timeDependent set to true
//               final ethiopianDate = gregorianDate.convertToEthiopian();

//               final convertedgregorianDate = ethiopianDate.convertToGregorian();
//               final convertedEthiopianDate =
//                   convertedgregorianDate.convertToEthiopian();
//               try {
//                 expect(gregorianDate.weekday, equals(ethiopianDate.weekday));
//                 expect(gregorianDate.year, equals(convertedgregorianDate.year));
//                 expect(
//                     gregorianDate.month, equals(convertedgregorianDate.month));
//                 expect(gregorianDate.day, equals(convertedgregorianDate.day));
//                 expect(gregorianDate.weekday,
//                     equals(convertedgregorianDate.weekday));
//                 expect(gregorianDate.hour, equals(convertedgregorianDate.hour));

//                 expect(ethiopianDate.year, equals(convertedEthiopianDate.year));
//                 expect(
//                     ethiopianDate.month, equals(convertedEthiopianDate.month));
//                 expect(ethiopianDate.day, equals(convertedEthiopianDate.day));
//                 expect(ethiopianDate.weekday,
//                     equals(convertedEthiopianDate.weekday));
//                 expect(ethiopianDate.hour, equals(convertedEthiopianDate.hour));
//                 testsrun++;
//               } catch (e) {
//                 print("origional ${gregorianDate.toString()}");
//                 print(
//                     "eth ${ethiopianDate.toString()}\t${ethiopianDate.timeofday}\n");
//                 print("converted gr ${convertedgregorianDate.toString()}");
//                 print(
//                     "converted et ${convertedEthiopianDate.toString()}\t${ethiopianDate.timeofday}");
//                 rethrow;
//               }
//             }
//           }
//         }
//       }
//       print("\n\n total tests run = ${testsrun * 10} \n\n");
//     });
//     test('Test Ethiopian to add days method', () {
//       int testsrun2 = 0;
//       for (int year = 2021; year <= 2024; year++) {
//         for (int month = 1; month <= 12; month++) {
//           for (int day = 1; day <= 30; day++) {
//             for (int hour = 0; hour <= 23; hour++) {
//               final ethiopianDate = ETDateTime(2021, month, day, hour);
//               final ethiopianDateadd = ethiopianDate.add(Duration(days: 1));
//               final addethiopianDate = ETDateTime(2021, month, day + 1, hour);

//               try {
//                 expect(ethiopianDateadd.year, equals(addethiopianDate.year));
//                 expect(ethiopianDateadd.month, equals(addethiopianDate.month));
//                 expect(ethiopianDateadd.day, equals(addethiopianDate.day));
//                 expect(
//                     ethiopianDateadd.weekday, equals(addethiopianDate.weekday));
//                 expect(ethiopianDateadd.hour, equals(addethiopianDate.hour));
//                 testsrun2++;
//               } catch (e) {
//                 print(
//                     "origional ${ethiopianDate.toString()}\t${ethiopianDate.timeofday}");
//                 print(
//                     "add metod ${ethiopianDateadd.toString()}\t${ethiopianDate.timeofday}");
//                 print("manual add ${addethiopianDate.toString()}");
//                 rethrow;
//               }
//             }
//           }
//         }
//       }
//       print("\n\n total tests run = ${testsrun2 * 5} \n\n");
//       ETDateTime mydate = ETDateTime(2018, 11, 3, 5);
//       print(mydate.subtract(Duration(days: 1)));
//       print(mydate.add(Duration(days: 333)));
//     });
//   });
// }
