import '../ethiopian_datetime.dart';
import 'etdatetime_converter.dart';

extension DateTimeConvertor on DateTime {
  /// Converts a given Gregorian [DateTime] to the Ethiopian calendar representation.
  ///
  /// This method takes a Gregorian [DateTime] object and converts it to the corresponding [ETDateTime] Ethiopian calendar date.
  ///
  /// Example:
  /// ```dart
  /// DateTime gregorianDate = DateTime(2024, 11, 27);
  /// ETDateTime ethiopianDate = gregorianDate.convertToEthiopian();
  /// print('Ethiopian Date: ${ethiopianDate.year}/${ethiopianDate.month}/${ethiopianDate.day}');
  /// //output 2017/3/18
  /// ```
  ETDateTime convertToEthiopian([bool timeDependent = false]) =>
      ETDateTimeConverter.toEthiopian(this, timeDependent: timeDependent);

  /// Casts the current Gregorian date time to Ethiopian date time.
  ///
  /// Returns an [ETDateTime] object representing the equivalent Gregorian date and time.
  /// The Ethiopian date time includes the Ethiopian year, month, day, hour, minute, second, millisecond, and microsecond.
  ///
  /// Example:
  /// ```dart
  /// final ethiopianDateTime = gregorianDateTime.asETDateTime;
  ///  // ethiopianDateTime is the same as "gregorianDateTime as ETDateTime"
  /// print(ethiopianDateTime.toString()); // Outputs the Ethiopian date time representation.
  /// ```
  /// It doesn't convert the date it is a type cast method
  /// use [convertToEthiopian] method to convert
  ETDateTime get asETDateTime {
    return ETDateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }
}
