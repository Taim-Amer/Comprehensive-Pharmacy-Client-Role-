import 'package:comprehensive_pharmacy_client_role/features/authentication/models/code_verification_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/resend_otp_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/models/signup_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signup/signup_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class SignupRepoImpl implements SignupRepo {
  static SignupRepoImpl get instance => Get.find();

  @override
  Future<SignupModel> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required double lat,
    required double lng,
    required String fcmToken,
  }) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.register, {
      'name' : name,
      'phone' : phone,
      'email' : email,
      'password' : password,
      'password_confirmation' : passwordConfirm,
      'lat' : lat,
      'lng' : lng,
      'fcm_token' : fcmToken
    }).then((response) => SignupModel.fromJson(response));
  }

  @override
  Future<ResendOtpModel> resendOtp({required String phone}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.resend, {
      'phone' : phone
    }).then((response) => ResendOtpModel.fromJson(response));
  }

  @override
  Future<CodeVerificationModel> verifyCode({required String phone, required String otp}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.verify, {
      'phone' : phone,
      'otp' : otp
    }).then((response) => CodeVerificationModel.fromJson(response));
  }
}