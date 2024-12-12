## ethiopian_datetime

A Dart /Flutter package for working with Ethiopian dates and times, providing conversion between Ethiopian and Gregorian calendars, date formatting, and utility functions.

## Features

- Convert Ethiopian dates to Gregorian dates and vice versa.
- Format Ethiopian dates in various styles with 4 ethiopian locales.
- Perform date arithmetic operations.
- Check for date equality and comparison.
- Utilities for working with Ethiopian dates.
- almost all Dart DateTime operations.

## Getting started

To use this package in your Dart project, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  ethiopian_datetime: ^1.0.0
```
for dart use 
```bash
  dart pub add ethiopian_datetime
```

for flutter
```bash
  flutter pub add ethiopian_datetime
```

## Usage

for all DateTime method replace DateTime with ETDateTime
for all intl DateFormat methods replace DateFormat with ETDateFormat
for all material dateutils methods replace DateUtils with ETDateUtils

```dart
import 'package:ethiopian_datetime/ethiopian_datetime.dart';

void main() {
    
    // Create an instance of ETDateTime with a specific Ethiopian date.
    final myDateTime = ETDateTime(2017, 3, 4);

    // Get the current Ethiopian date and time.
    ETDateTime now = ETDateTime.now();
    print(now);

    // Convert the current Ethiopian date and time to the Gregorian calendar.
    DateTime gregorianNow = now.convertToGregorian();
    print(gregorianNow);

    //formate datetime to String with desired locale and pattern
    print(ETDateFormat("dd-MMMM-yyyy HH:mm:ss")
      .format(now)); // 29-ሕዳር-2017 10:32:21
    print(ETDateFormat.MMMMEEEEd('ti').format(now)); // ሰንበት, ሕዳር 29

    //  Retrieve time of day names used in the Ethiopian calendar.
    print(ETDateUtils.dayOnly(now)); // 2017-03-29 12:00:00.000000

}

```

## Documentation
For detailed API documentation, refer to the API Reference.

## Contact
If you want to contact me you can reach me at rarksule30@gmail.com.

## Contributing
If you'd like to contribute to this package, feel free to open issues or submit pull requests on the GitHub repository.

## License
This package is licensed under the BSD 3-Clause License. See the LICENSE file for more details.
"# ethiopian_datetime" 
