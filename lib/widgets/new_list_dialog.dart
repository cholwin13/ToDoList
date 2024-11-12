import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimens.dart';
import 'custom_text_form_field.dart';

class NewListDialog extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final Function(String) callback;
  const NewListDialog({super.key, required this.controller, required this.formKey, required this.callback});

  @override
  State<NewListDialog> createState() => _NewListDialogState();
}

class _NewListDialogState extends State<NewListDialog> {
  String? validateNewList(value) {
    if (value!.isEmpty) {
      return 'Enter Text!!';
    } else {
      return null;
    }
  }

  void _submit() {
    if (widget.formKey.currentState!.validate()) {
      Navigator.of(context).pop();
      widget.callback(widget.controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(AppDimens.borderRadius)),
        ),
        title: const Text(
          "New List",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppDimens.fontMedium),
        ),
        content: CustomTextFormFieldWidget(
          textController: widget.controller,
          validator: validateNewList,
          textInputType: TextInputType.text,
          hintTxt: 'AA',
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "CANCEL",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: AppDimens.fontMedium),
              )),
          TextButton(
              onPressed: () {
                _submit();
              },
              child: const Text(
                "ADD",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: AppDimens.fontMedium),
              ))
        ],
      ),
    );
  }
}