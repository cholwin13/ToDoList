import 'package:flutter/material.dart';
import 'package:to_do_list/resources/app_colors.dart';
import 'package:to_do_list/resources/app_dimens.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;

  final void Function()? onFinishEditing;

  final String hintTxt;

  final TextEditingController? textController;

  final String? Function(String?)? validator;

  final bool readOnlyValue;

  final TextInputType textInputType;

  final bool? errorBorderColor;

  final bool buyOnlineStyle;

  const CustomTextFormFieldWidget({
    super.key,
    this.onChanged,
    this.onFinishEditing,
    required this.hintTxt,
    this.textController,
    this.validator,
    this.readOnlyValue = false,
    this.textInputType = TextInputType.number,
    this.errorBorderColor,
    this.buyOnlineStyle = false,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      onTapOutside: (value){
        FocusManager.instance.primaryFocus?.unfocus();
        if (onFinishEditing != null) onFinishEditing!();
      },
      onEditingComplete: (){
        FocusManager.instance.primaryFocus?.unfocus();
        if (onFinishEditing != null) onFinishEditing!();
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.grayColor
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.errorColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorStyle: const TextStyle(fontSize: AppDimens.fontMedium),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.errorColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        isDense: true,
      ),

      keyboardType: textInputType,
      validator: validator,
      onChanged: onChanged,
      controller: textController,
      readOnly: readOnlyValue,
    );
  }
}
