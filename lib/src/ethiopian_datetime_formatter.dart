// ignore_for_file: non_constant_identifier_names
import 'package:intl/intl.dart';
import 'etdatetime.dart';
import 'ethiopian_datetime_symbols.dart';

class ETDateFormat extends DateFormat {
  @override
  final String pattern;
  String? _locale;

  ETDateFormat(this.pattern, [this._locale]) {
    _locale ??= RegExp(r"^(am|om|so|ti)$").hasMatch(Intl.getCurrentLocale())
        ? Intl.getCurrentLocale()
        : "en";
  }

  ETDateFormat.d([locale]) : this('d', locale);
  ETDateFormat.E([locale]) : this('E', locale);
  ETDateFormat.EEEE([locale]) : this('EEEE', locale);
  ETDateFormat.LLL([locale]) : this('LLL', locale);
  ETDateFormat.LLLL([locale]) : this('LLLL', locale);
  ETDateFormat.M([locale]) : this('M', locale);
  ETDateFormat.Md([locale]) : this('Md', locale);
  ETDateFormat.MEd([locale]) : this('MEd', locale);
  ETDateFormat.MMM([locale]) : this('MMM', locale);
  ETDateFormat.MMMd([locale]) : this('MMMd', locale);
  ETDateFormat.MMMEd([locale]) : this('MMMEd', locale);
  ETDateFormat.MMMM([locale]) : this('MMMM', locale);
  ETDateFormat.MMMMd([locale]) : this('MMMMd', locale);
  ETDateFormat.MMMMEEEEd([locale]) : this('MMMMEEEEd', locale);
  ETDateFormat.QQQ([locale]) : this('QQQ', locale);
  ETDateFormat.QQQQ([locale]) : this('QQQQ', locale);
  ETDateFormat.y([locale]) : this('y', locale);
  ETDateFormat.yM([locale]) : this('yM', locale);
  ETDateFormat.yMd([locale]) : this('yMd', locale);
  ETDateFormat.yMEd([locale]) : this('yMEd', locale);
  ETDateFormat.yMMM([locale]) : this('yMMM', locale);
  ETDateFormat.yMMMd([locale]) : this('yMMMd', locale);
  ETDateFormat.yMMMEd([locale]) : this('yMMMEd', locale);
  ETDateFormat.yMMMM([locale]) : this('yMMMM', locale);
  ETDateFormat.yMMMMd([locale]) : this('yMMMMd', locale);
  ETDateFormat.yMMMMEEEEd([locale]) : this('yMMMMEEEEd', locale);
  ETDateFormat.yQQQ([locale]) : this('yQQQ', locale);
  ETDateFormat.yQQQQ([locale]) : this('yQQQQ', locale);
  ETDateFormat.H([locale]) : this('H', locale);
  ETDateFormat.Hm([locale]) : this('Hm', locale);
  ETDateFormat.Hms([locale]) : this('Hms', locale);
  ETDateFormat.j([locale]) : this('j', locale);
  ETDateFormat.jm([locale]) : this('jm', locale);
  ETDateFormat.jms([locale]) : this('jms', locale);

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
        String time = DateFormat('H').format(date);
        int numtime = int.parse(time);
        switch (date.timeofday) {
          case "TEWAT":
            numtime = numtime + (date.hour < 12 ? 6 : -6);
            break;
          case 'QEN':
            numtime = numtime + 6;
            break;
          case 'MATA':
            numtime = numtime + (date.hour < 12 ? 18 : 6);
            break;
        }
        formattedDate = formattedDate.replaceFirst(
          time,
          '${numtime < 10 ? "0" : ""}$numtime',
        );
      }
      if (timeofday) {
        String time = DateFormat(timeofdayPattern).format(date);
        formattedDate = formattedDate.replaceFirst(time,
            time.replaceAllMapped(RegExp(r'^(\d+(:\d+){0,2})\s*(AM|PM)$'), (match) {
          final number = match.group(1);
          return etDateSymbol(
              _locale, date.timeofday, -timeofdayPattern.length, time: number!);
        }));
      }
      if (Era) {
        formattedDate = formattedDate.replaceFirst(
          DateFormat('G').format(date),
          etDateSymbol(_locale, "ERAS", DateFormat('G').format(date) == 'BC' ? 1 : 2),
        );
      }
      return formattedDate;
    } else {
      return DateFormat(pattern, _locale).format(date);
    }
  }
}
