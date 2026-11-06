import 'package:fisis_tarot/core/state/app_settings.dart';
import 'package:fisis_tarot/general.dart';

class SingletonManager {
  SingletonManager._() {
    Get.put(AppSettings());
  }

  static final SingletonManager _instance = SingletonManager._();

  static SingletonManager get instance => _instance;
}
