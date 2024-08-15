import 'package:app/src/components/main/badge/app_badge_base_builder.dart';
import 'package:app/src/config/app_theme_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_tab_bar_widget.dart';

part 'app_tab_only_text_widget.dart';

part 'app_tab_with_icon_widget.dart';

part 'app_tab_with_number_widget.dart';

enum AppTabSize {
  large(size: 'large', value: 48),
  medium(size: 'medium', value: 40);

  final String size;
  final double value;

  const AppTabSize({required this.size, required this.value});
}

abstract class AppTabBaseBuilder extends StatelessWidget {
  @protected
  final String? label;
  @protected
  final int? number;
  @protected
  final Widget? iconSelected;
  @protected
  final Widget? iconUnselected;
  @protected
  final bool? isSelected;
  @protected
  final AppTabSize? appTabSize;

  const AppTabBaseBuilder({
    super.key,
    this.label,
    this.number,
    this.iconSelected,
    this.iconUnselected,
    this.isSelected,
    this.appTabSize,
  });

  AppTabBaseBuilder copyWith({
    String? label,
    int? number,
    bool? isSelected,
    AppTabSize? appTabSize,
    Widget? iconSelected,
    Widget? iconUnselected,
  });

  Widget textBase(BuildContext context) {
    return appTabSize == AppTabSize.large
        ? Text(label ?? "", style: textStyle(context))
        : Text(label ?? "", style: textStyle(context));
  }

  TextStyle? textStyle(BuildContext context) => appTabSize == AppTabSize.large
      ? isSelected == true
          ? context.textTheme.bodyLarge?.copyWith(color: colorBase)
          : AppThemeExt.of.textTheme.bodyMedium?.copyWith(color: colorBase)
      : isSelected == true
          ? context.textTheme.bodyMedium?.copyWith(color: colorBase)
          : AppThemeExt.of.textTheme.bodyMedium?.copyWith(color: colorBase);

  Color? get colorBase => isSelected == true
      ? AppThemeExt.of.colorScheme.primary
      : AppThemeExt.of.colorScheme.secondary;

  EdgeInsetsGeometry get paddingBase => appTabSize == AppTabSize.large
      ? EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorScale(2),
          vertical: AppThemeExt.of.majorScale(3),
        )
      : EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorScale(3),
          vertical: AppThemeExt.of.majorScale(2),
        );
}
