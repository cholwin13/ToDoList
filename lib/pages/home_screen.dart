import 'package:flutter/material.dart';
import 'package:to_do_list/resources/app_colors.dart';
import 'package:to_do_list/resources/app_dimens.dart';
import 'package:to_do_list/widgets/list_view_widget.dart';

import '../widgets/new_list_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  String selectedPopUpName = 'All List';
  TextEditingController newListController = TextEditingController();
  List selectedDetails = [];

  List popupItemsList = [
    {
      'id': 0,
      'value': 0,
      'icon': const Icon(
        Icons.home,
        color: AppColors.primaryColor,
      ),
      'title': 'All List',
      'listCount': '5',
      'details': [
        {'name': 'CL all list', 'phNo': '09780370347'},
        {'name': 'myo lwin', 'phNo': '09780370347'}
      ]
    },
    {
      'id': 1,
      'value': 1,
      'icon': const Icon(
        Icons.format_list_bulleted,
        color: AppColors.primaryColor,
      ),
      'title': 'Default',
      'listCount': '1',
      'details': [
        {'name': 'CL default', 'phNo': '09780370347'},
        {'name': 'myo lwin', 'phNo': '09780370347'}
      ]
    },
    {
      'id': 2,
      'value': 2,
      'icon': const Icon(
        Icons.format_list_bulleted,
        color: AppColors.primaryColor,
      ),
      'title': 'Personal',
      'details': [
        {'name': 'CL Personal', 'phNo': '09780370347'},
        {'name': 'myo lwin', 'phNo': '09780370347'}
      ]
    },
    {
      'id': 3,
      'value': 3,
      'icon': const Icon(
        Icons.format_list_bulleted,
        color: AppColors.primaryColor,
      ),
      'title': 'Shopping',
      'listCount': '1',
      'details': [
        {'name': 'CL Shopping', 'phNo': '09780370347'},
        {'name': 'myo lwin', 'phNo': '09780370347'}
      ]
    },
    {
      'id': 4,
      'value': 4,
      'icon': const Icon(
        Icons.format_list_bulleted,
        color: AppColors.primaryColor,
      ),
      'title': 'Wishlist',
      'details': [
        {'name': 'CL Wishlist', 'phNo': '09780370347'},
        {'name': 'myo lwin', 'phNo': '09780370347'}
      ]
    },
    {
      'id': 5,
      'value': 5,
      'icon': const Icon(
        Icons.format_list_bulleted,
        color: AppColors.primaryColor,
      ),
      'title': 'Work',
      'listCount': '1',
      'details': [
        {'name': 'CL Work', 'phNo': '09780370347'},
        {'name': 'myo lwin', 'phNo': '09780370347'}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PopupMenuButton(
          onSelected: (val) {
            if (val != null) {
              _changeListName(val);
            }
          },
          initialValue: selectedPopUpName,
          itemBuilder: (context) {
            return [
              for (int i = 0; i < popupItemsList.length; i++)
                PopupMenuItem(
                  onTap: () {
                    setState(() {
                      selectedDetails = popupItemsList[i]['details'] ?? [];
                    });
                  },
                  value: popupItemsList[i]['title'],
                  child: ListTile(
                    leading: popupItemsList[i]['icon'],
                    title: Text(
                      popupItemsList[i]['title'],
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppDimens.fontSmall3X),
                    ),
                    trailing: popupItemsList[i]['listCount'] != null
                        ? Text(
                            popupItemsList[i]['listCount'],
                            style: TextStyle(color: AppColors.errorColor),
                          )
                        : Text(''),
                  ),
                ),
              const PopupMenuItem(
                  child: ListTile(
                leading: Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  'Finished',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppDimens.fontSmall3X),
                ),
                trailing: Text(
                  '3',
                  style: TextStyle(color: AppColors.errorColor),
                ),
              )),
              PopupMenuItem(
                  child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showDialog(context);
                },
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.playlist_add_outlined,
                        color: AppColors.grayColor,
                      ),
                    ),
                    Text(
                      'New List',
                      style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: AppDimens.fontSmall3X),
                    )
                  ],
                ),
              )),
            ];
          },
          child: Row(
            children: [
              Text(
                selectedPopUpName,
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppDimens.fontMedium),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.whiteColor,
              ),
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
            icon: const Icon(Icons.more_vert_outlined,
                color: AppColors.whiteColor),
          ),
        ],
      ),
      body: selectedDetails.isEmpty
        ? const Center(child: Text('Nothing to do'))
      : ListViewWidget(
          selectedDetails: selectedDetails,
      )
    );
  }

  _changeListName(String listName) {
    setState(() {
      selectedPopUpName = listName;
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => NewListDialog(controller: newListController, formKey: formKey)
    );
  }
}


