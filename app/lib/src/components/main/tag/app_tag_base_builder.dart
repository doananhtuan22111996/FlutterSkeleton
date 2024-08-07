import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme_ext.dart';
import 'package:flutter/material.dart';

import '../../../exts/R.dart';
import '../../../generated/assets/assets.gen.dart';

// part 'app_state_tag_widget.dart';

enum AppTagBaseType {
  success,
  error,
  warning,
  processing,
  cancel,
  waiting,
  value,
  disabled,
  actionTagWidgetIcon,
  actionTagDisabled,
  actionTagOnlyText,
}

abstract class AppTagBaseBuilder extends StatelessWidget {
  @protected
  final String? tag;
  @protected
  final AppTagBaseType? appTagBaseType;

  const AppTagBaseBuilder({
    super.key,
    this.tag,
    this.appTagBaseType = AppTagBaseType.disabled,
  });
}
