import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/tabbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_status_chip.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/orders_header.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(OrdersController());
    return DefaultTabController(
      length: 4,
      child: Builder(
        builder: (BuildContext context) {
          final tabController = DefaultTabController.of(context);
          return Scaffold(
            drawer: const GeneralDrawer(),
            appBar: const TAppBar(
              title: GeneralAppbar(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
              child: Column(
                children: [
                  const OrdersHeader(),
                  (TSizes.defaultSpace * 2).verticalSpace,
                  TTabBar(
                    tabs: List.generate(4,
                        (index) => OrderStatusChip(
                              index: index,
                              tabController: tabController,
                              text: OrdersController.instance.orderStatusChipList[index],
                            )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
