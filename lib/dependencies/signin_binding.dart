import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/signin_controller.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
  }
}