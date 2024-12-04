import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.language_circle, color: dark ? TColors.light : const Color(0xFF383838), size: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TEnglishTexts.languages, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                Text(TEnglishTexts.languageSelect, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.more_vert, color: dark ? TColors.light : const Color(0xFF383838)),
        ),
      ],
    );
  }
}