import 'package:apple_gadget_task/app/data/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final String text;
  final TextStyle? textStyle;
  final Function()? onTap;

  const PrimaryButton({
    Key? key,
     this.height,
     this.width,
    this.color,
    required this.text,
    this.onTap,
    this.borderRadius,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: height ?? 40,
        decoration: ShapeDecoration(
          color: color ?? AppColors.primaryButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 14),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ?? AppTextStyle.authTextStyle,
          ),
        ),
      ),
    );
  }
}
