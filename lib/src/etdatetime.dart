import 'etdatetime_converter.dart';
import 'ethiopian_datetime_symbols.dart';

/// Represents a date and time in the Ethiopian calendar system.
class ETDateTime extends DateTime {
  /// The month in the Ethiopian calendar system (1-13).
  @override
  int month;

  /// The day of the month.
  @override
  int day;

  /// The year in the Ethiopian calendar system.
  @override
  int year;

  /// The hour of the day (0-23).
  @override
  int hour;

  /// The day of the week (1-7 where 7 represents Sunday).
  @override
  int weekday = 1;

  final int? _weekday;

  /// The minute within the hour (0-59).
  @override
  int minute;

  /// The second within the minute (0-59).
  @override
  int second;

  /// The millisecond within the second (0-999).
  @override
  int millisecond;

  /// The microsecond within the millisecond (0-999).
  @override
  int microsecond;

  /// A string representing the time of day (e.g., 'QEN','MATA,'TEWAT, or 'LELIT').
  String timeofday;

  // Month constants that are returned by the [month] getter.
  static const int meskerem = 1;
  static const int tikimt = 2;
  static const int hidar = 3;
  static const int tahsas = 4;
  static const int tir = 5;
  static const int yekatit = 6;
  static const int megabit = 7;
  static const int miyazya = 8;
  static const int ginbot = 9;
  static const int sene = 10;
  static const int hamle = 11;
  static const int nehase = 12;
  static const int pagume = 13;
  static const int monthsPerYear = 13;
  static const int segno = 1;
  static const int maksegno = 2;
  static const int erob = 3;
  static const int hamus = 4;
  static const int arb = 5;
  static const int qdame = 6;
  static const int ehud = 7;
  static const int daysPerWeek = 7;

  /// Represents a date and time in the Ethiopian calendar system.
  ///
  /// The year is required, and the timeofday is optional.
  ///  If the time is not provided, it will be calculated based on whether it is QEN (morning) or LELET (night).
  ///  Alternatively, providing the time in 24-hour format will start the time calculation from 00:00 TEWAT.
  ///
  ///example
  /// ```dart
  ///
  /// ETDateTime ethiopianNow = ETDateTime(2017,3,3,1,0,0,0,0,'MATA'); //evening 1:00
  /// ethiopianNow = ETDateTime(2017,3,3,13,0,0,0,0,) //evening 1:00
  /// ```
  ///
  ETDateTime(
    this.year, [
    this.month = 1,
    this.day = 1,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.millisecond = 0,
    this.microsecond = 0,
    this.timeofday = '',
    this._weekday,
  ]) : super(year, month, day, hour, minute, second, millisecond, microsecond) {
    weekday = _weekday ?? ETDateTimeConverter.getweekday(this);

    while (day > 30 ||
        month > 13 ||
        (month == 13 &&
            ((year % 4 == 3 && day > 6) || (year % 4 != 3 && day > 5)))) {
      if (month > 13) {
        month -= 13;
        year++;
      } else if (month == 13) {
        if (year % 4 == 3 && day > 6) {
          // Leap year Pagumē
          day -= 6;
        } else if (year % 4 != 3 && day > 5) {
          // Regular year Pagumē
          day -= 5;
        }
        month = 1;
        year++;
      } else if (day > 30) {
        // Other months
        day -= 30;
        month++;
        if (month > 13) {
          // Ensure month wraps around
          month = 1;
          year++;
        }
      }
    }

    while (day < 1 || month < 1) {
      if (month < 1) {
        month += 13;
        year--;
      } else {
        // Move to the previous month, wrapping around if it's January
        month = (month == 1) ? 13 : month - 1;

        // Add the appropriate number of days based on the current month
        day += (month != 13)
            ? 30
            : (year % 4 == 3)
                ? 6
                : 5; // Adjust for Pagumē in leap and non-leap years

        // Adjust the year if the month wraps to Pagumē
        if (month == 13) {
          year--;
        }
      }
    }
    if (hour > 4 && hour < 12 && timeofday == '') {
      timeofday = ETDateTimeConverter.qen;
    } else if (hour == 12 && timeofday == '') {
      timeofday = ETDateTimeConverter.mata;
    } else if (hour > 12) {
      timeofday =
          hour < 18 ? ETDateTimeConverter.mata : ETDateTimeConverter.lelit;
      hour -= 12;
    } else {
      timeofday = ETDateTimeConverter.tewat;
    }
    if (hour == 0 || hour == 24) {
      hour = 12;
    }
  }

  /// Returns the current date and time in the Ethiopian calendar.
  ///
  /// This method converts the current system [DateTime] to the Ethiopian calendar representation [ETDateTime].
  ///
  /// Example:
  /// ```dart
  /// ETDateTime ethiopianNow = ETDateTime.now();
  /// print('Current Ethiopian Date: ${ethiopianNow.year}/${ethiopianNow.month}/${ethiopianNow.day}');
  /// ```
  static ETDateTime now([bool timeDependent = false]) {
    return ETDateTimeConverter.toEthiopian(DateTime.now(),
        timeDependent: timeDependent);
  }
  @Deprecated('use ETDateUtils methods')
  static List<String> listOfETDateSymbol(String? locale, String key) {
    return ethiopianDateSymbols[locale]![key]!;
  }

  @override
  ETDateTime add(Duration duration) {
    final date = _add(duration, true);
    return ETDateTime(year, month, (day + duration.inDays), date.hour,
        date.minute, date.second, date.millisecond, date.microsecond);
  }

  @override
  ETDateTime subtract(Duration duration) {
    final date = _add(duration, false);
    return ETDateTime(year, month, (day - duration.inDays), date.hour,
        date.minute, date.second, date.millisecond, date.microsecond);
  }

  DateTime _add(Duration duration, bool isAdd) {
    Duration newDuration = Duration(
        hours: duration.inHours % 24,
        minutes: duration.inMinutes % 60,
        seconds: duration.inSeconds % 60,
        microseconds: duration.inMicroseconds % 1000000,
        milliseconds: duration.inMilliseconds % 1000);
    return isAdd ? super.add(newDuration) : super.subtract(newDuration);
  }

  /// Converts the current Ethiopian [ETDateTime] object to the Gregorian calendar[DateTime].
  ///
  /// Example:
  /// ```dart
  /// ETDateTime ethiopianDate = ETDateTime(2014, 4, 3);
  /// DateTime gregorianDate = ethiopianDate.convertToGregorian();
  /// print('Gregorian Date: ${gregorianDate.year}-${gregorianDate.month}-${gregorianDate.day}');
  /// //output : 2021-12-12
  /// ```
  DateTime convertToGregorian([bool timeDependent = false]) =>
      ETDateTimeConverter.toGregorian(this, timeDependent: timeDependent);
}
