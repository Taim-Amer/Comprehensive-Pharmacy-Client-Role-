import 'dart:io';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/cancel_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/create_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/order/order_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:get/get.dart' as ins;
import 'package:dio/dio.dart';

class OrderRepoImpl implements OrderRepo{
  static OrderRepoImpl get instance => ins.Get.find();

  String? token = TCacheHelper.getData(key: 'token');

  @override
  Future<AllOrdersModel> getMyOrders() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.showMyOrders,
      token: token,
    ).then((response) => AllOrdersModel.fromJson(response));
  }

  @override
  Future<OrderStatusModel> orderStatus({required int orderID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.orderStatus,
      queryParameters: {'order_id': orderID},
      token: token,
    ).then((response) => OrderStatusModel.fromJson(response));
  }

  @override
  Future<ShowOrderModel> showOrder({required int orderID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.showOrder,
      queryParameters: {'order_id': orderID},
      token: token,
    ).then((response) => ShowOrderModel.fromJson(response));
  }

  @override
  Future<CancelOrderModel> cancelOrder({required int orderID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.cancel,
      {'order_id': orderID},
      token: token,
    ).then((response) => CancelOrderModel.fromJson(response));
  }

  @override
  Future<CreateOrderModel> createOrder({required int pharmacistID, String? description, required List<File> filesList,}) async {
    final dioHelper = TDioHelper();
    final formData = FormData();

    for (var file in filesList) {
      final multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );
      formData.files.add(MapEntry('files', multipartFile));
    }

    formData.fields.addAll([
      MapEntry('pharmacist_id', pharmacistID.toString()),
      if (description != null) MapEntry('description', description),
    ]);
    
    return await dioHelper.post(
      TApiConstants.create,
      formData,
      token: token,
    ).then((response) => CreateOrderModel.fromJson(response));
  }
}