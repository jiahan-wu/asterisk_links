# asterisk_links

This Flutter plugin adds support for opening an application from the browser when user clicks on the link. Better known as:
- Universal Links on iOS
- App Links on Android

## Usage

To use this plugin, add `asterisk_links` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

### Example

```dart
import 'package:flutter/material.dart';
import 'package:asterisk_links/asterisk_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Uri?> webpageURL = AsteriskLinks.webpageURL;

  void reloadWebpageURL() {
    setState(() {
      webpageURL = AsteriskLinks.webpageURL;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Uri?>(
        future: webpageURL,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text("${snapshot.data}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.autorenew),
        onPressed: reloadWebpageURL,
      ),
    );
  }
}
```