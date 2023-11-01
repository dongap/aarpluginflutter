import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'untitled1_platform_interface.dart';

/// An implementation of [Untitled1Platform] that uses method channels.
class MethodChannelUntitled1 extends Untitled1Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('untitled1');

  @override
  Future<String?> getPlatformVersion(dataToPass) async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion',dataToPass);
    return version;
  }
}


