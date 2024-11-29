import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class GeneralAppbar extends StatelessWidget {
  const GeneralAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Iconsax.more, color: dark ? TColors.light : const Color(0xFF383838)),
        ),
        Text('Client App', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: dark ? TColors.light : const Color(0xFF383838))),
        Icon(Iconsax.notification, color: dark ? TColors.light : const Color(0xFF383838)),
      ],
    );
  }
}