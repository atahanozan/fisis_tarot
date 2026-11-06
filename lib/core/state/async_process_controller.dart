import 'package:fisis_tarot/general.dart';

class AsyncProcessController extends GetxController {
  bool isRunning = false;

  static AsyncProcessController get init => Get.put(AsyncProcessController());
  static AsyncProcessController get instance =>
      Get.find<AsyncProcessController>();

  void updateIsRunning(bool isRunning) {
    this.isRunning = isRunning;
    update();
  }

  Future<dynamic> run(Function() function, {bool showLoader = true}) async {
    if (showLoader) {
      isRunning = true;
      update();
    }
    try {
      var res = await function();

      if (showLoader) {
        isRunning = false;
        update();
      }

      return res;
    } catch (e, stackTrace) {
      // AppSettings.instance.logger.e(e.toString());
      // AppSettings.instance.logger.e(stackTrace.toString());
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }
    }
    if (showLoader) {
      isRunning = false;
      update();
    }
  }
}
