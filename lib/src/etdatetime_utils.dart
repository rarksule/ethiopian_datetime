import 'etdatetime.dart';
import 'ethiopian_datetime_symbols.dart';

///utiility class for ethiopian datetime and retrieving
///date related Strings
final class ETDateUtils {
  /// Returns a [ETDateTime] with the date of the original, but time set to
  /// morning 12:00.
  static ETDateTime dateOnly(ETDateTime date) {
    return ETDateTime(date.year, date.month, date.day);
  }

  /// Returns true if the two [ETDateTime] objects have the same day, month, and
  /// year, or are both null.
  static bool isSameDay(ETDateTime? dateA, ETDateTime? dateB) {
    return dateA?.year == dateB?.year &&
        dateA?.month == dateB?.month &&
        dateA?.day == dateB?.day;
  }

  /// Returns true if the two [ETDateTime] objects have the same month and
  /// year, or are both null.
  static bool isSameMonth(ETDateTime? dateA, ETDateTime? dateB) {
    return dateA?.year == dateB?.year && dateA?.month == dateB?.month;
  }

  /// Determines the number of months between two [ETDateTime] objects.
  ///
  /// For example:
  ///
  /// ```dart
  /// ETDateTime date1 = ETDateTime(2019, 6, 15);
  /// ETDateTime date2 = ETDateTime(2020, 1, 15);
  /// int delta = DateUtils.monthDelta(date1, date2);
  /// ```
  ///
  /// The value for `delta` would be `8`.
  static int monthDelta(ETDateTime startDate, ETDateTime endDate) {
    return (endDate.year - startDate.year) * 13 +
        endDate.month -
        startDate.month;
  }

  /// Returns a [ETDateTime] that is [monthDate] with the added number
  /// of months and the day set to 1 and time set to midnight.
  ///
  /// For example:
  ///
  /// ```dart
  /// ETDateTime date = ETDateTime(2019, 1, 15);
  /// ETDateTime futureDate = ETDateUtils.addMonthsToMonthDate(date, 3);
  /// ```
  ///
  /// `date` would be meskerem 15, 2019.
  /// `futureDate` would be tahsas 1, 2019 since it adds 3 months.
  static ETDateTime addMonthsToMonthDate(
      ETDateTime monthDate, int monthsToAdd) {
    return ETDateTime(monthDate.year, monthDate.month + monthsToAdd);
  }

  /// Returns a [ETDateTime] with the added number of days and time set to
  /// midnight.
  static ETDateTime addDaysToDate(ETDateTime date, int days) {
    return ETDateTime(date.year, date.month, date.day + days);
  }

  /// Returns the number of days in a month, according to the proleptic
  /// Gregorian calendar.
  ///
  /// This applies the leap year logic introduced by the Gregorian reforms of
  /// 1582. It will not give valid results for dates prior to that time.
  static int getDaysInMonth(int year, int month) {
    if (month == ETDateTime.pagume) {
      final bool isLeapYear = (year % 4 == 3);
      return isLeapYear ? 6 : 5;
    }
    return 30;
  }

  /// Returns a list of month names based on the Ethiopian calendar.
  ///
  /// Example:
  /// ```dart
  /// List<String> monthNames = ETDateUtils.getMonthNames('am'); //["መስከረም","ጥቅምት","ሕዳር","ታሕሣስ","ጥር","የካቲት","መጋቢት","ሚያዚያ","ግንቦት","ሰኔ","ሐምሌ","ነሐሴ","ጳጉሜ"]
  /// ```
  /// if locale is not given defaults to 'am'
  /// Returns a list of month names in the specified locale.
  static List<String> getMonthNames([locale]) {
    if (ethiopianDateSymbols[locale ?? "am"] == null) {
      return ethiopianDateSymbols["am"]!["MONTHS"]!;
    }
    return ethiopianDateSymbols[locale ?? "am"]!["MONTHS"]!;
  }

  /// Returns a list of shortMonth names based on the Ethiopian calendar.
  ///
  /// Example:
  /// ```dart
  /// List<String> shortMonthNames = ETDateUtils.getShortMonthNames('am'); //["መስከ","ጥቅም","ሕዳር","ታሕሣ","ጥር","የካቲ","መጋቢ","ሚያዚ","ግንቦ","ሰኔ","ሐምሌ","ነሐሴ","ጳጉሜ"]
  /// ```
  /// if locale is not given defaults to 'am'
  /// Returns a list of shortMonth names in the specified locale.
  static List<String> getShortMonthNames([locale]) {
    if (ethiopianDateSymbols[locale ?? "am"] == null) {
      return ethiopianDateSymbols["am"]!["SHORTMONTHS"]!;
    }
    return ethiopianDateSymbols[locale ?? "am"]!["SHORTMONTHS"]!;
  }

  /// Returns a list of narrowMonth names based on the Ethiopian calendar.
  ///
  /// Example:
  /// ```dart
  /// List<String> narrowMonthNames = ETDateUtils.getNarrowMonthNames('am'); //["መ","ጥ","ህ","ታ","ጥ","የ","መ","ሚ","ግ","ሰ","ሐ","ነ","ጳ"]
  /// ```
  /// if locale is not given defaults to 'am'
  /// Returns a list of narrowMonth names in the specified locale.
  static List<String> getNarrowMonthNames([locale]) {
    if (ethiopianDateSymbols[locale ?? "am"] == null) {
      return ethiopianDateSymbols["am"]!["NARROWMONTHS"]!;
    }
    return ethiopianDateSymbols[locale ?? "am"]!["NARROWMONTHS"]!;
  }

  /// Returns a list of Weekday names based on the Ethiopian calendar.
  ///
  /// Example:
  /// ```dart
  /// List<String> WeekdayNames = ETDateUtils.getWeekDayNames('am'); //["ሰኞ","ማክሰኞ","ረቡዕ","ሐሙስ","ዓርብ","ቅዳሜ","እሁድ"]
  /// ```
  /// if locale is not given defaults to 'am'
  /// Returns a list of Weekday names in the specified locale.
  static List<String> getWeekDayNames([locale]) {
    if (ethiopianDateSymbols[locale ?? "am"] == null) {
      return ethiopianDateSymbols["am"]!["WEEKDAYS"]!;
    }
    return ethiopianDateSymbols[locale ?? "am"]!["WEEKDAYS"]!;
  }

  /// Returns a list of shortWeekday names based on the Ethiopian calendar.
  ///
  /// Example:
  /// ```dart
  /// List<String> shortWeekdayNames = ETDateUtils.getShortWeekDayNames('am'); //["ሰኞ","ማክሰ","ረቡዕ","ሐሙስ","ዓርብ","ቅዳሜ","እሁድ"]
  /// ```
  /// if locale is not given defaults to 'am'
  /// Returns a list of shortWeekday names in the specified locale.
  static List<String> getShortWeekDayNames([locale]) {
    if (ethiopianDateSymbols[locale ?? "am"] == null) {
      return ethiopianDateSymbols["am"]!["SHORTWEEKDAYS"]!;
    }
    return ethiopianDateSymbols[locale ?? "am"]!["SHORTWEEKDAYS"]!;
  }

  /// Returns a list of narrowWeekDay names based on the Ethiopian calendar.
  ///
  /// Example:
  /// ```dart
  /// List<String> narrowWeekDayNames = ETDateUtils.getNarrowWeekDayNames('am'); //["ሰ","ማ","ረ","ሐ","ዓ","ቅ","እ",]
  /// ```
  /// if locale is not given defaults to 'am'
  /// Returns a list of narrowWeekDay names in the specified locale.
  static List<String> getNarrowWeekDayNames([locale]) {
    if (ethiopianDateSymbols[locale ?? "am"] == null) {
      return ethiopianDateSymbols["am"]!["NARROWWEEKDAYS"]!;
    }
    return ethiopianDateSymbols[locale ?? "am"]!["NARROWWEEKDAYS"]!;
  }

  /// Returns a list of timeofDay names based on the Ethiopian calendar.
  ///
  /// Example:
  /// ```dart
  /// List<String> timeofDays = ETDateUtils.getTimeOfDayNames('am'); //['ቀን','ማታ','ጠዋት','ለሊት']
  /// ```
  /// if locale is not given defaults to 'am'
  /// Returns a list of timeofDays names in the specified locale.
  static List<String> getTimeOfDayNames([locale]) {
    final value =
        ethiopianDateSymbols[locale ?? "am"] ?? ethiopianDateSymbols["am"]!;

    final result = [
      value['QEN']![0],
      value['MATA']![0],
      value['TEWAT']![0],
      value['LELIT']![0]
    ];
    return result;
  }
}
