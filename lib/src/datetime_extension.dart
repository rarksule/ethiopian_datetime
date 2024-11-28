
import '../ethiopian_datetime.dart';
import 'etdatetime_converter.dart';

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
extension DateTimeConvertor on DateTime{
  ETDateTime convertToEthiopian() => ETDateTimeConverter.toEthiopian(this);

  // DateTime convertToEthiopian() => ETDateTimeConverter.toEthiopian(this);
 
}
