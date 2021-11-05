import 'dart:async';

import 'package:flutter/services.dart';

class AsteriskLinks {
  static const MethodChannel _channel = MethodChannel('asterisk_links');

  static Future<Uri?> get webpageURL async {
    final String? webpageUrlString =
        await _channel.invokeMethod('getWebpageUrlString');
    if (webpageUrlString != null) {
      final uri = Uri.parse(webpageUrlString);
      return uri;
    }
    return null;
  }
}
