import 'package:get/get.dart';
import '../controllers/toggle_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToggleController>(() => ToggleController());
  }
}
