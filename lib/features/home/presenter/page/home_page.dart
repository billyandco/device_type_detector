import 'package:device_type_detector/features/home/presenter/page/home_page_mobile.dart';
import 'package:device_type_detector/features/home/presenter/page/home_page_tv.dart';
import 'package:device_type_detector/features/home/presenter/page/home_page_wear.dart';
import 'package:device_type_detector/widget/device_detector_builder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return switch (context.device()) {
      DeviceType.tv => const HomePageTv(),
      DeviceType.wear => const HomePageWear(),
      _ => const HomePageMobile(),
    };
  }
}
