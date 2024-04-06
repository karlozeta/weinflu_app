class WeinFluDateUtils {
  WeinFluDateUtils._();
  static String getOrdinalDay(DateTime dateTime) {
    int day = dateTime.day;
    String ordinalDay;
    if (day >= 11 && day <= 13) {
      ordinalDay = '${day}th';
    } else if (day % 10 == 1) {
      ordinalDay = '${day}st';
    } else if (day % 10 == 2) {
      ordinalDay = '${day}nd';
    } else if (day % 10 == 3) {
      ordinalDay = '${day}rd';
    } else {
      ordinalDay = '${day}th';
    }
    return ordinalDay;
  }
}
