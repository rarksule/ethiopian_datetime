
import 'etdatetime_converter.dart';

class ETDateTime extends DateTime{

  @override
  int month;

  @override
  int day;

  @override
  int year;

  @override
  int hour;

  @override
  int weekday;

  @override
  int minute;

  @override
  int second;

  @override
  int millisecond;

  @override
  int microsecond;

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


  ETDateTime(this.year, 
      [
      this.month = 1,
      this.day = 1,
      this.hour = 0,
      this.minute = 0,
      this.second = 0,
      this.millisecond = 0,
      this.microsecond = 0,this.weekday = 1,this.timeofday = 'TEWAT']) : assert(month<=monthsPerYear),
       super(year,month,day,hour,minute,second,millisecond,microsecond){
        weekday = super.weekday+ (super.weekday>3 ? -3: 4);
        if (day > 6 && year % 4 ==3  && month == 13) {
          day = day -6;
          month = 1;
          year++;
        }
        if (day > 5 && year % 4 != 3 && month == 13) {
          day = day - 5;
          month = 1;
          year++;
        }
        if(day>30){
          month++;
          day = day-30;
        }
        if(month>13){
          month = 1;
          year ++;
        }
        if(day<1){
          month = month + (month==1 ? 12 : -1);
          day =month!=13 ? 30 : (year % 4 ==0) ? 6 : 5;
          year = year - (month==13 ? 1 : 0);
        }
        if(hour>12){
          timeofday = hour<18 ? 'LELIT' : "MATA";
          hour = hour - 12;
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
static ETDateTime now(){
  return ETDateTimeConverter.toEthiopian(DateTime.now());
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
DateTime convertToGregorian() => ETDateTimeConverter.toGregorian(this);

}

