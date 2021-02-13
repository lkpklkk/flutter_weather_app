import 'package:intl/intl.dart';

class Util {
  static String appId = "0f16740be0b1228a44e1684e12f8d26c";

  static getFormattedDate(DateTime date) {
    return DateFormat("EEEE, MMM d, y").format(date);
  }
}
