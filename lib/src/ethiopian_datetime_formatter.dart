// ignore_for_file: non_constant_identifier_names
import 'package:intl/intl.dart';
import 'etdatetime.dart';
import 'etdatetime_converter.dart';
import 'ethiopian_datetime_symbols.dart';

/// DateFormatting class for Ethiopian Datetime
///  inspired by intl
class ETDateFormat extends DateFormat {
  @override
  final String pattern;
  String? _locale;

  /// Creates an Ethiopian date format object with the specified pattern and optional locale.
  ///
  /// Parameters:
  /// - pattern: The format pattern for the Ethiopian date representation.
  /// - _locale: An optional parameter specifying the locale for formatting (supported values: "am", "om", "so", "ti") (default is "am") Amharic.
  ///-
  /// Example:
  /// ```dart
  /// final ethiopianFormat = ETDateFormat("dd/MM/yyyy", "am");
  /// final ethiopianDate = ETDateTime(2014, 13, 5); // Ethiopian date: 2014/13/5
  /// final formattedEthiopianDate = ethiopianFormat.format(ethiopianDate);
  /// print(formattedEthiopianDate); // Outputs the formatted Ethiopian date.
  /// ```
  ETDateFormat(this.pattern, [this._locale]) {
    _locale ??= "am";
  }

  /// Creates an Ethiopian date format object with the pattern 'd' and optional locale.
  /// format for day value number
  ETDateFormat.d([locale]) : this('d', locale);

  /// Creates an Ethiopian date format object with the pattern 'E' and optional locale.
  /// format for short weekday value String
  ETDateFormat.E([locale]) : this('E', locale);

  /// Creates an Ethiopian date format object with the pattern 'EEEE' and optional locale.
  ETDateFormat.EEEE([locale]) : this('EEEE', locale);

  /// Creates an Ethiopian date format object with the pattern 'LLL' and optional locale.
  ETDateFormat.LLL([locale]) : this('LLL', locale);

  /// Creates an Ethiopian date format object with the pattern 'LLLL' and optional locale.
  ETDateFormat.LLLL([locale]) : this('LLLL', locale);

  /// Creates an Ethiopian date format object with the pattern 'M' and optional locale.
  ETDateFormat.M([locale]) : this('M', locale);

  /// Creates an Ethiopian date format object with the pattern 'E' and optional locale.
  ETDateFormat.Md([locale]) : this('Md', locale);

  /// Creates an Ethiopian date format object with the pattern 'MEd' and optional locale.
  ETDateFormat.MEd([locale]) : this('MEd', locale);

  /// Creates an Ethiopian date format object with the pattern 'E' and optional locale.
  ETDateFormat.MMM([locale]) : this('MMM', locale);

  /// Creates an Ethiopian date format object with the pattern 'MMM' and optional locale.
  ETDateFormat.MMMd([locale]) : this('MMMd', locale);

  /// Creates an Ethiopian date format object with the pattern 'MMMEd' and optional locale.
  ETDateFormat.MMMEd([locale]) : this('MMMEd', locale);

  /// Creates an Ethiopian date format object with the pattern 'MMMM' and optional locale.
  ETDateFormat.MMMM([locale]) : this('MMMM', locale);

  /// Creates an Ethiopian date format object with the pattern 'MMMMd' and optional locale.
  ETDateFormat.MMMMd([locale]) : this('MMMMd', locale);

  /// Creates an Ethiopian date format object with the pattern 'MMMMEEEEd' and optional locale.
  ETDateFormat.MMMMEEEEd([locale]) : this('MMMMEEEEd', locale);

  /// Creates an Ethiopian date format object with the pattern 'QQQ' and optional locale.
  ETDateFormat.QQQ([locale]) : this('QQQ', locale);

  /// Creates an Ethiopian date format object with the pattern 'QQQQ' and optional locale.
  ETDateFormat.QQQQ([locale]) : this('QQQQ', locale);

  /// Creates an Ethiopian date format object with the pattern 'y' and optional locale.
  ETDateFormat.y([locale]) : this('y', locale);

  /// Creates an Ethiopian date format object with the pattern 'yM' and optional locale.
  ETDateFormat.yM([locale]) : this('yM', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMd' and optional locale.
  ETDateFormat.yMd([locale]) : this('yMd', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMEd' and optional locale.
  ETDateFormat.yMEd([locale]) : this('yMEd', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMMM' and optional locale.
  ETDateFormat.yMMM([locale]) : this('yMMM', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMMMd' and optional locale.
  ETDateFormat.yMMMd([locale]) : this('yMMMd', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMMMEd' and optional locale.
  ETDateFormat.yMMMEd([locale]) : this('yMMMEd', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMMMM' and optional locale.
  ETDateFormat.yMMMM([locale]) : this('yMMMM', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMMMMd' and optional locale.
  ETDateFormat.yMMMMd([locale]) : this('yMMMMd', locale);

  /// Creates an Ethiopian date format object with the pattern 'yMMMMEEEEd' and optional locale.
  ETDateFormat.yMMMMEEEEd([locale]) : this('yMMMMEEEEd', locale);

  /// Creates an Ethiopian date format object with the pattern 'yQQQ' and optional locale.
  ETDateFormat.yQQQ([locale]) : this('yQQQ', locale);

  /// Creates an Ethiopian date format object with the pattern 'yQQQQ' and optional locale.
  ETDateFormat.yQQQQ([locale]) : this('yQQQQ', locale);

  /// Creates an Ethiopian date format object with the pattern 'H' and optional locale.
  ETDateFormat.H([locale]) : this('H', locale);

  /// Creates an Ethiopian date format object with the pattern 'Hm' and optional locale.
  ETDateFormat.Hm([locale]) : this('Hm', locale);

  /// Creates an Ethiopian date format object with the pattern 'Hms' and optional locale.
  ETDateFormat.Hms([locale]) : this('Hms', locale);

  /// Creates an Ethiopian date format object with the pattern 'j' and optional locale.
  ETDateFormat.j([locale]) : this('j', locale);

  /// Creates an Ethiopian date format object with the pattern 'jm' and optional locale.
  ETDateFormat.jm([locale]) : this('jm', locale);

  /// Creates an Ethiopian date format object with the pattern 'jms' and optional locale.
  ETDateFormat.jms([locale]) : this('jms', locale);

  /// Converts the provided [date] parameter, assumed to be aDateTime object,
  ///
  /// Returns a formatted string representation of the Ethiopian DateTime.
  ///
  ///Takes optional locale parameter value of String
  /// Example:
  /// ```dart
  /// final ethiopianFormatter = ETDateFormatter();
  /// final gregorianDate = DateTime.now();
  /// final formattedEthiopianDate = ethiopianFormatter.format(gregorianDate);
  /// print(formattedEthiopianDate); // Outputs the formatted Ethiopian date representation.
  /// ```
  /// possible locales ('am','om','so','ti') ommiting it defaults to 'am'
  @override
  String format(DateTime date) {
    return _format(date as ETDateTime);
  }

  String _format(ETDateTime date) {
    if (RegExp(r"^(am|om|so|ti)$").hasMatch(_locale ?? "")) {
      String formattedDate = DateFormat(pattern).format(date);
      bool month = RegExp(r'(L{4}|M{4})').hasMatch(pattern);
      bool shortMonth = RegExp(r'(L{3}|M{3})').hasMatch(pattern);
      bool narrowMonth = RegExp(r'L{1,2}').hasMatch(pattern);
      bool weekday = RegExp(r'E{4}').hasMatch(pattern);
      bool shortweekday = RegExp(r'E{3}').hasMatch(pattern);
      bool narrowWeekday = RegExp(r'E{1,2}').hasMatch(pattern);
      bool Hour = RegExp(r'H{1,2}').hasMatch(pattern);
      bool Era = RegExp(r'G{1,2}').hasMatch(pattern);
      bool timeofday = RegExp(r'j(m|s)?(s)?').hasMatch(pattern);
      String timeofdayPattern =
          timeofday ? RegExp(r'j(m|s)?(s)?').firstMatch(pattern)![0]! : "j";
      if (month) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat.MMMM().format(date),
          etDateSymbol(_locale, "MONTHS", date.month),
        );
      }
      if (shortMonth) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat.LLL().format(date),
          etDateSymbol(_locale, "SHORTMONTHS", date.month),
        );
      }
      if (narrowMonth) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat('LL').format(date),
          etDateSymbol(_locale, "NARROWMONTHS", date.month),
        );
      }
      if (weekday) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat('EEEE').format(date),
          etDateSymbol(_locale, "WEEKDAYS", date.weekday),
        );
      }
      if (shortweekday) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat('EEE').format(date),
          etDateSymbol(_locale, "SHORTWEEKDAYS", date.weekday),
        );
      }
      if (narrowWeekday) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat('EE').format(date),
          etDateSymbol(_locale, "NARROWWEEKDAYS", date.weekday),
        );
      }
      if (Hour) {
        String time = DateFormat('HH').format(date);
        int numtime = int.parse(time);
        if (date.timeofday == ETDateTimeConverter.mata ||
            date.timeofday == ETDateTimeConverter.lelit) {
          numtime = numtime + (date.hour == 12 ? 0 : 12);
        }
        formattedDate = formattedDate.replaceFirst(
          time,
          '${numtime < 10 ? "0" : ""}$numtime',
        );
      }
      if (timeofday) {
        String time = DateFormat(timeofdayPattern).format(date);
        formattedDate = formattedDate.replaceFirst(
            time,
            time.replaceAllMapped(RegExp(r'^(\d+(:\d+){0,2})\s*(AM|PM)$'),
                (match) {
              final number = match.group(1);
              return etDateSymbol(
                  _locale, date.timeofday, -timeofdayPattern.length,
                  time: number!);
            }));
      }
      if (Era) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat('G').format(date),
          etDateSymbol(
              _locale, "ERAS", DateFormat('G').format(date) == 'BC' ? 1 : 2),
        );
      }
      return formattedDate;
    } else {
      return DateFormat(pattern, _locale).format(date);
    }
  }
}
