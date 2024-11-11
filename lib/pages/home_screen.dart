import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/resources/app_images.dart';
import 'package:to_do_list/resources/app_colors.dart';
import 'package:to_do_list/resources/app_dimens.dart';

import '../widgets/custom_text_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPopUpName = 'All List';
  TextEditingController newListController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List popupItemsList = [
    {'value': 0, 'icon': Icon(Icons.home, color: AppColors.primaryColor,), 'title': 'All List', 'listCount': '5'},
    {'value': 1, 'icon': Icon(Icons.format_list_bulleted, color: AppColors.primaryColor,), 'title': 'Default', 'listCount': '1'},
    {'value': 2, 'icon': Icon(Icons.format_list_bulleted, color: AppColors.primaryColor,), 'title': 'Personal', },
    {'value': 3, 'icon': Icon(Icons.format_list_bulleted, color: AppColors.primaryColor,), 'title': 'Shopping', 'listCount': '1'},
    {'value': 4, 'icon': Icon(Icons.format_list_bulleted, color: AppColors.primaryColor,), 'title': 'Wishlist', },
    {'value': 5, 'icon': Icon(Icons.format_list_bulleted, color: AppColors.primaryColor,), 'title': 'Work', 'listCount': '1'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PopupMenuButton(
          onSelected: (val) {
            if(val != null){
              _changeListName(val);
            }
          },
          initialValue: selectedPopUpName,
          itemBuilder: (context) {
            return [
              for(int i = 0; i < popupItemsList.length; i++)
                PopupMenuItem(
                  value: popupItemsList[i]['title'],
                  child: ListTile(
                    leading: popupItemsList[i]['icon'],
                    title: Text(popupItemsList[i]['title'], style: const TextStyle(
                      color: AppColors.primaryColor,
                        fontSize: AppDimens.fontSmall3X
                    ),),
                    trailing: popupItemsList[i]['listCount'] != null ?
                    Text(popupItemsList[i]['listCount'], style: TextStyle(color: AppColors.errorColor),)
                    : Text(''),
                  ),
                ),
              const PopupMenuItem(child: ListTile(
                leading: Icon(Icons.check_circle_rounded, color: AppColors.primaryColor,),
                title: Text('Finished', style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: AppDimens.fontSmall3X
                ),),
                trailing: Text('3', style: TextStyle(color: AppColors.errorColor),),
              )),
              PopupMenuItem(child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showDialog(context);
                },
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.playlist_add_outlined, color: AppColors.grayColor,),
                    ),
                    Text('New List', style: TextStyle(
                      color: AppColors.grayColor,
                        fontSize: AppDimens.fontSmall3X
                    ),)
                  ],
                ),
              )),
            ];
          },
          child: Row(
            children: [
              Text(selectedPopUpName, style: const TextStyle(color: AppColors.whiteColor, fontSize: AppDimens.fontMedium),),
              const Icon(Icons.arrow_drop_down,color: AppColors.whiteColor,),
            ],
          ),
        ),
        leading: const Icon(
          Icons.check_circle,
          color: AppColors.whiteColor,
          size: AppDimens.iconLarge,
        ),
        backgroundColor: AppColors.primaryColor,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.whiteColor,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined, color: AppColors.whiteColor),
          ),
        ],
      ),
      body: Center(
        child: Text("To Do List"),
      ),
    );
  }

  _changeListName(String listName){
    setState(() {
      selectedPopUpName = listName;
    });
  }

  String? validateNewList(value) {
    if (value!.isEmpty) {
      return 'Enter Text!!';
    } else {
      return null;
    }
  }

  void _submit() {
    if (formKey.currentState!.validate()) {
      print("Add");
    }
  }

  _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Form(
            key: formKey,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppDimens.borderRadius)),
              ),
              title: const Text("New List", style: TextStyle(color: AppColors.primaryColor, fontSize: AppDimens.fontMedium),),
              content: CustomTextFormFieldWidget(
                textController: newListController,
                validator: validateNewList,
                textInputType: TextInputType.text, hintTxt: 'AA',
              ),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text("CANCEL", style: TextStyle(color: AppColors.primaryColor, fontSize: AppDimens.fontMedium),)),
                TextButton(onPressed: (){
                  _submit();
                },
                    child: const Text("ADD",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: AppDimens.fontMedium),
                ))
              ],
            ),
          );
        });
  }
}
