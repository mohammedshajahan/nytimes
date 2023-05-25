import 'dart:convert';

class Helpers {
  static final baseUrl = "https://api.nytimes.com";
  static final apikey = "l9wIFHZ94o53agw31CVM8XI6JdWCmwqK";

  /// Auth & Login Services
  static final String get_most_viewed =
      "$baseUrl/svc/mostpopular/v2/mostviewed/";

  /// Image url
  static final String avatarUrl = "https://mobcontent.ril.com/picture/";
}
