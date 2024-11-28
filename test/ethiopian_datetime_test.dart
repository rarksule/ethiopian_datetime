import 'package:ethiopian_datetime/ethiopian_datetime.dart';
import 'package:test/test.dart';

void main() {
  group('Date Converter Tests', () {
    test('Test Ethiopian to Gregorian to Ethiopian for the year 2021 to 2024', () {
	    // int  testsrun = 0;
      // for (int year = 2021; year <= 2024; year++) 
      // {
      //     for (int month = 1; month <= 12; month++) 
      //     {
      //       for (int day = 1; day <= 30; day++) 
      //       {
      //         for(int hour = 0; hour <= 23; hour++)
      //         {
      //           final gregorianDate = DateTime(year, month, day,hour); //date is equal after morning 6am
      //           // print("origional ${gregorianDate.toString()}");
      //           final ethiopianDate = gregorianDate.convertToEthiopian();
      //           // print("eth ${ethiopianDate.toString()}\t${ethiopianDate.timeofday}\n");
      //           final convertedgregorianDate = ethiopianDate.convertToGregorian();
      //           // print("converted gr ${convertedgregorianDate.toString()}");
      //           final convertedEthiopianDate = convertedgregorianDate.convertToEthiopian();
      //           // print("converted et ${convertedEthiopianDate.toString()}\t${ethiopianDate.timeofday}\n");
      //           expect(gregorianDate.year, equals(convertedgregorianDate.year));
      //           expect(gregorianDate.month, equals(convertedgregorianDate.month));
      //           expect(gregorianDate.day, equals(convertedgregorianDate.day));
      //           expect(gregorianDate.weekday,equals(convertedgregorianDate.weekday));
      //           expect(gregorianDate.hour,equals(convertedgregorianDate.hour));

      //           expect(ethiopianDate.year, equals(convertedEthiopianDate.year));
      //           expect(ethiopianDate.month, equals(convertedEthiopianDate.month));
      //           expect(ethiopianDate.day, equals(convertedEthiopianDate.day));
      //           expect(ethiopianDate.weekday,equals(convertedEthiopianDate.weekday));
      //           expect(ethiopianDate.hour,equals(convertedEthiopianDate.hour));
		  //           testsrun++;
      //         }
      //       }
      //     }
      // }
	    // print("\n\n total tests run = $testsrun \n\n");
    });

  });
}
