import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asterisk_links/asterisk_links.dart';

void main() {
  const MethodChannel channel = MethodChannel('asterisk_links');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'https://example.com';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getWebpageURL', () async {
    expect(await AsteriskLinks.webpageURL, Uri.parse("https://example.com"));
  });
}
