import '../ethiopian_datetime.dart';

class ETDateTimeConverter {
  static int month = 1;

  static int day = 1;

  static int year = 2000;

  static int hour = 0;

  static int weekday = 1;

  static int minute = 0;

  static int second = 0;

  static int millisecond = 0;

  static int microsecond = 0;

  static String timeofday = '';

  static const mata = 'MATA';
  static const lelit = 'LELIT';
  static const tewat = 'TEWAT';
  static const qen = 'QEN';

  static DateTime toGregorian(ETDateTime etdatetime,
      {bool timeDependent = false}) {
    bool ispostLeap = etdatetime.year % 4 == 0;
    year = etdatetime.year + 8;
    switch (etdatetime.month) {
      case ETDateTime.meskerem:
        year = etdatetime.year + 7;
        if (ispostLeap) {
          month = etdatetime.day < 20 ? 9 : 10;
          day = etdatetime.day + (etdatetime.day < 20 ? 11 : -19);
          break;
        }
        month = etdatetime.day < 21 ? 9 : 10;
        day = etdatetime.day + (etdatetime.day < 21 ? 10 : -20);

        break;
      case ETDateTime.tikimt:
        year = etdatetime.year + 7;
        if (ispostLeap) {
          month = etdatetime.day < 21 ? 10 : 11;
          day = etdatetime.day + (etdatetime.day < 21 ? 11 : -20);
          break;
        }
        month = etdatetime.day < 22 ? 10 : 11;
        day = etdatetime.day + (etdatetime.day < 22 ? 10 : -21);

        break;
      case ETDateTime.hidar:
        year = etdatetime.year + 7;
        if (ispostLeap) {
          month = etdatetime.day < 21 ? 11 : 12;
          day = etdatetime.day + (etdatetime.day < 21 ? 10 : -20);
          break;
        }
        month = etdatetime.day < 22 ? 11 : 12;
        day = etdatetime.day + (etdatetime.day < 22 ? 9 : -21);
        break;

      case ETDateTime.tahsas:
        if (ispostLeap) {
          month = etdatetime.day < 22 ? 12 : 1;
          day = etdatetime.day + (etdatetime.day < 22 ? 10 : -21);
          year = etdatetime.year + (etdatetime.day < 22 ? 7 : 8);
          break;
        }
        month = etdatetime.day < 23 ? 12 : 1;
        day = etdatetime.day + (etdatetime.day < 23 ? 9 : -22);
        year = etdatetime.year + (etdatetime.day < 23 ? 7 : 8);
        break;

      case ETDateTime.tir:
        if (ispostLeap) {
          month = etdatetime.day < 23 ? 1 : 2;
          day = etdatetime.day + (etdatetime.day < 23 ? 9 : -22);
          break;
        }
        month = etdatetime.day < 24 ? 1 : 2;
        day = etdatetime.day + (etdatetime.day < 24 ? 8 : -23);

        break;

      case ETDateTime.yekatit:
        if (ispostLeap) {
          month = etdatetime.day < 22 ? 2 : 3;
          day = etdatetime.day + (etdatetime.day < 22 ? 8 : -21);
          break;
        }
        month = etdatetime.day < 22 ? 2 : 3;
        day = etdatetime.day + (etdatetime.day < 22 ? 7 : -21);
        break;

      case ETDateTime.megabit:
        month = etdatetime.day < 23 ? 3 : 4;
        day = etdatetime.day + (etdatetime.day < 23 ? 9 : -22);
        break;

      case ETDateTime.miyazya:
        month = etdatetime.day < 23 ? 4 : 5;
        day = etdatetime.day + (etdatetime.day < 23 ? 8 : -22);
        break;

      case ETDateTime.ginbot:
        month = etdatetime.day < 24 ? 5 : 6;
        day = etdatetime.day + (etdatetime.day < 24 ? 8 : -23);
        break;

      case ETDateTime.sene:
        month = etdatetime.day < 24 ? 6 : 7;
        day = etdatetime.day + (etdatetime.day < 24 ? 7 : -23);
        break;

      case ETDateTime.hamle:
        month = etdatetime.day < 25 ? 7 : 8;
        day = etdatetime.day + (etdatetime.day < 25 ? 7 : -24);
        break;

      case ETDateTime.nehase:
        month = etdatetime.day < 26 ? 8 : 9;
        day = etdatetime.day + (etdatetime.day < 26 ? 6 : -25);
        break;

      case ETDateTime.pagume:
        month = 9;
        day = etdatetime.day + 5;
    }
    if (etdatetime.timeofday == lelit) {
      hour = etdatetime.hour - 6;
      if (timeDependent) day++;
    } else if (etdatetime.timeofday == mata) {
      hour = etdatetime.hour + (etdatetime.hour != 12 ? 18 : 6);
    } else if (etdatetime.timeofday == qen) {
      hour = etdatetime.hour + 6;
    } else {
      hour = etdatetime.hour + (etdatetime.hour == 12 ? -6 : 6);
    }

    return DateTime(year, month, day, hour, etdatetime.minute,
        etdatetime.second, etdatetime.millisecond, etdatetime.microsecond);
  }

  /// method to convert greg to Ethio
  static ETDateTime toEthiopian(DateTime datetime,
      {bool timeDependent = false}) {
    bool ispreLeap = datetime.year % 4 == 3;
    bool isLeap = datetime.year % 4 == 0;
    year = datetime.year - 8;
    switch (datetime.month) {
      case DateTime.march:
        month = datetime.day < 10 ? 6 : 7;
        day = datetime.day + (datetime.day < 10 ? 21 : -9);
        break;
      case DateTime.april:
        month = datetime.day < 9 ? 7 : 8;
        day = datetime.day + (datetime.day < 9 ? 22 : -8);
        break;
      case DateTime.may:
        month = datetime.day < 9 ? 8 : 9;
        day = datetime.day + (datetime.day < 9 ? 22 : -8);
        break;
      case DateTime.june:
        month = datetime.day < 8 ? 9 : 10;
        day = datetime.day + (datetime.day < 8 ? 23 : -7);
        break;
      case DateTime.july:
        month = datetime.day < 8 ? 10 : 11;
        day = datetime.day + (datetime.day < 8 ? 23 : -7);

        break;
      case DateTime.august:
        month = datetime.day < 7 ? 11 : 12;
        day = datetime.day + (datetime.day < 7 ? 24 : -6);
        break;
      case DateTime.september:
        if (datetime.day < 6) {
          month = 12;
          day = datetime.day + 25;
          break;
        } else if (ispreLeap) {
          month = datetime.day < 12 ? 13 : 1;
          day = datetime.day + (datetime.day < 12 ? -5 : -11);
          year = datetime.year - (datetime.day < 12 ? 8 : 7);
        } else {
          month = datetime.day < 11 ? 13 : 1;
          day = datetime.day + (datetime.day < 11 ? -5 : -10);
          year = datetime.year - (datetime.day < 11 ? 8 : 7);
        }
        break;
      case DateTime.october:
        if (ispreLeap) {
          month = datetime.day < 12 ? 1 : 2;
          day = datetime.day + (datetime.day < 12 ? 19 : -11);
          year = datetime.year - 7;
        } else {
          month = datetime.day < 11 ? 1 : 2;
          day = datetime.day + (datetime.day < 11 ? 20 : -10);
          year = datetime.year - 7;
        }
        break;
      case DateTime.november:
        if (ispreLeap) {
          month = datetime.day < 11 ? 2 : 3;
          day = datetime.day + (datetime.day < 11 ? 20 : -10);
          year = datetime.year - 7;
        } else {
          month = datetime.day < 10 ? 2 : 3;
          day = datetime.day + (datetime.day < 10 ? 21 : -9);
          year = datetime.year - 7;
        }
        break;
      case DateTime.december:
        if (ispreLeap) {
          month = datetime.day < 11 ? 3 : 4;
          day = datetime.day + (datetime.day < 11 ? 20 : -10);
          year = datetime.year - 7;
        } else {
          month = datetime.day < 10 ? 3 : 4;
          day = datetime.day + (datetime.day < 10 ? 21 : -9);
          year = datetime.year - 7;
        }
        break;
      case DateTime.january:
        if (isLeap) {
          month = datetime.day < 10 ? 4 : 5;
          day = datetime.day + (datetime.day < 10 ? 21 : -9);
        } else {
          month = datetime.day < 9 ? 4 : 5;
          day = datetime.day + (datetime.day < 9 ? 22 : -8);
        }
        break;
      case DateTime.february:
        if (isLeap) {
          month = datetime.day < 9 ? 5 : 6;
          day = datetime.day + (datetime.day < 9 ? 22 : -8);
        } else {
          month = datetime.day < 8 ? 5 : 6;
          day = datetime.day + (datetime.day < 8 ? 23 : -7);
        }
    }
    if (datetime.hour < 6) {
      hour = datetime.hour + 18;
      if (timeDependent) day--;
    } else {
      hour = datetime.hour - 6;
    }

    return ETDateTime(
        year,
        month,
        day,
        hour,
        datetime.minute,
        datetime.second,
        datetime.millisecond,
        datetime.microsecond,
        timeofday,
        datetime.weekday);
  }

  static int getweekday(ETDateTime date) =>
      date.convertToGregorian().convertToEthiopian().weekday;
}
