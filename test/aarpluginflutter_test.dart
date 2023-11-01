import 'package:flutter_test/flutter_test.dart';
import 'package:aarpluginflutter/aarpluginflutter.dart';
import 'package:aarpluginflutter/aarpluginflutter_platform_interface.dart';
import 'package:aarpluginflutter/aarpluginflutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAarpluginflutterPlatform
    with MockPlatformInterfaceMixin
    implements AarpluginflutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AarpluginflutterPlatform initialPlatform = AarpluginflutterPlatform.instance;

  test('$MethodChannelAarpluginflutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAarpluginflutter>());
  });

  test('getPlatformVersion', () async {
    Aarpluginflutter aarpluginflutterPlugin = Aarpluginflutter();
    MockAarpluginflutterPlatform fakePlatform = MockAarpluginflutterPlatform();
    AarpluginflutterPlatform.instance = fakePlatform;

    expect(await aarpluginflutterPlugin.getPlatformVersion(), '42');
  });
}
