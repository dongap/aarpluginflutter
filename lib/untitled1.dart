import 'untitled1_platform_interface.dart';

class Untitled1 {

  Future<String?> getPlatformVersion(dataToPass) {
    return Untitled1Platform.instance.getPlatformVersion(dataToPass);
  }
}
