import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

enum DeviceType {
  wear,
  tv,
  mobile;
}

// await DeviceInfoPlugin().androidInfo;
extension AndroidDeviceInfoType on AndroidDeviceInfo {
  static const _hardwareTypeTV = 'android.hardware.type.television';

  static const _hardwareTypeWatch = 'android.hardware.type.watch';

  DeviceType get deviceType {
    if (systemFeatures.contains(_hardwareTypeTV)) {
      return DeviceType.tv;
    } else if (systemFeatures.contains(
      _hardwareTypeWatch,
    )) {
      return DeviceType.wear;
    }

    return DeviceType.mobile;
  }
}

extension DeviceStateExt on BuildContext {
  DeviceType? device() {
    return dependOnInheritedWidgetOfExactType<DeviceState>()?.type;
  }
}

class DeviceState extends InheritedWidget {
  const DeviceState({
    super.key,
    required this.type,
    required super.child,
  });

  final DeviceType type;

  @override
  bool updateShouldNotify(covariant DeviceState oldWidget) {
    return type != oldWidget.type;
  }
}

class DeviceDetectorBuilder extends StatefulWidget {
  const DeviceDetectorBuilder({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  State<DeviceDetectorBuilder> createState() => _DeviceDetectorBuilderState();
}

class _DeviceDetectorBuilderState extends State<DeviceDetectorBuilder> {
  late final Future<DeviceType> future;

  @override
  void initState() {
    super.initState();

    future = Future(() async {
      if (!Platform.isAndroid) {
        return DeviceType.mobile;
      }

      final info = await DeviceInfoPlugin().androidInfo;
      return info.deviceType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        return DeviceState(
          type: snapshot.data!,
          child: widget.builder(context),
        );
      },
    );
  }
}
