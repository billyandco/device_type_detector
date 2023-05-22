import 'package:device_type_detector/features/home/presenter/page/home_page.dart';
import 'package:device_type_detector/widget/device_detector_builder.dart';
import 'package:flutter/material.dart';

class DeviceTypeDetectorApp extends StatelessWidget {
  const DeviceTypeDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
      builder: (context, child) => DeviceDetectorBuilder(
        builder: (context) => child ?? const SizedBox(),
      ),
    );
  }
}
