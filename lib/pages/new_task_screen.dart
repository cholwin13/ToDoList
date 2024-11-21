import 'package:flutter/material.dart';
import 'package:to_do_list/resources/app_dimens.dart';

import '../navigation/custom_navigation_route.dart';
import '../resources/app_colors.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/new_list_dialog.dart';
import '../widgets/new_task_route_parameters.dart';

class NewTaskScreen extends StatefulWidget {
  final NewTaskRouteParameter arguments;
  const NewTaskScreen({super.key, required this.arguments});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final formKey = GlobalKey<FormState>();
  final dialogListFormKey = GlobalKey<FormState>();
  late String selectedList;
  late List newPopupItemList;

  TextEditingController newListController = TextEditingController();

  static const Icon defaultIcon = Icon(
    Icons.home,
    color: AppColors.primaryColor,
  );

  @override
  void initState() {
    selectedList = widget.arguments.popupItemsList[0]['title'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController newTaskController = TextEditingController();
    TextEditingController newDateController = TextEditingController();

    String? validateNewTask(value) {
      if (value!.isEmpty) {
        return 'Enter Text!!';
      } else {
        return null;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('New Task'),
        titleTextStyle: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: AppDimens.fontMedium
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(
          color: AppColors.whiteColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingLarge),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('What is to be done?', style: TextStyle(
                fontSize: AppDimens.fontMedium,
                color: AppColors.primaryColor
              ),),
              const SizedBox(
                height: AppDimens.paddingSmall,
              ),
              CustomTextFormFieldWidget(
                textController: newTaskController,
                validator: validateNewTask,
                textInputType: TextInputType.text,
                hintTxt: 'AA',
              ),
              const SizedBox(
                height: AppDimens.paddingLarge,
              ),
              const Text('Due Date', style: TextStyle(
                  fontSize: AppDimens.fontMedium,
                  color: AppColors.primaryColor
              ),),
              const SizedBox(
                height: AppDimens.paddingSmall,
              ),
              CustomTextFormFieldWidget(
                textController: newDateController,
                textInputType: TextInputType.text,
                hintTxt: 'AA',
              ),
              const SizedBox(
                height: AppDimens.paddingLarge + AppDimens.paddingLarge + AppDimens.paddingLarge,
              ),
              const Text('Add to List', style: TextStyle(
                  fontSize: AppDimens.fontMedium,
                  color: AppColors.primaryColor
              ),),
              const SizedBox(
                height: AppDimens.paddingSmall,
              ),
              Row(
                children: [
                  Flexible(
                    child: DropdownButton(
                      isExpanded: true,
                      value: selectedList,
                      items: widget.arguments.popupItemsList.map((item) {
                        return DropdownMenuItem<String>(
                          value: item['title'],
                          child: Text(item['title'], style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: AppDimens.fontMedium
                          ),),
                        );
                      }).toList(),
                      onChanged: (dynamic newValue) {
                        setState(() {
                          selectedList = newValue!;
                        });
                      },
                      iconEnabledColor: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: AppDimens.paddingLarge),
                  IconButton(onPressed: (){
                    _showDialog(context);
                  }, icon: const Icon(Icons.format_list_bulleted, color: AppColors.primaryColor,))
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        tooltip: 'AddTask',
        onPressed: (){
          if(formKey.currentState!.validate()){
            CustomNavigationRoute.router.pop(
              {
                'title': selectedList,
                'newDetail': {'name': newTaskController.text, 'phNo': '09986560228', 'isFinish': false},
              }
            );
          }
        },
        child: const Icon(Icons.check, color: Colors.white, size: AppDimens.iconLarge),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => NewListDialog(
          controller: newListController,
          formKey: dialogListFormKey,
          callback: (String newListName) {
            setState(() {
             widget.arguments.popupItemsList.add({
                'id':  widget.arguments.popupItemsList.length + 1,
                'icon': defaultIcon,
                'title': newListName,
                'details': []
              },);
            });
            newPopupItemList = widget.arguments.popupItemsList;
          },
        )
    );
  }

}
