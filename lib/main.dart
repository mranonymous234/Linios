import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const _channel = MethodChannel('qemu_launcher');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiny Core Linux in Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Run Tiny Core Linux')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => _channel.invokeMethod('launch', {'gui': false}),
                child: const Text('Run in Terminal'),
              ),
              ElevatedButton(
                onPressed: () => _channel.invokeMethod('launch', {'gui': true}),
                child: const Text('Run with GUI (VNC)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
