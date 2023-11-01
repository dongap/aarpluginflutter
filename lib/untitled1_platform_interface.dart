import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'untitled1_method_channel.dart';

abstract class Untitled1Platform extends PlatformInterface {
  /// Constructs a Untitled1Platform.
  Untitled1Platform() : super(token: _token);

  static final Object _token = Object();

  static Untitled1Platform _instance = MethodChannelUntitled1();

  /// The default instance of [Untitled1Platform] to use.
  ///
  /// Defaults to [MethodChannelUntitled1].
  static Untitled1Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Untitled1Platform] when
  /// they register themselves.
  static set instance(Untitled1Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion(Map<String, String> dataToPass) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
