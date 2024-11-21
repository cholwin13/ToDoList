import 'package:flutter/material.dart';
import 'package:to_do_list/navigation/custom_navigation_route.dart';
import 'package:to_do_list/resources/app_colors.dart';
import 'package:to_do_list/resources/app_dimens.dart';
import 'package:to_do_list/widgets/list_view_widget.dart';
import 'package:to_do_list/widgets/new_task_route_parameters.dart';

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
  bool isUpdated = false;
  String finishedCount = "";

  List<dynamic> _isChecked = [];
  List<dynamic> finishedList = [];

  static const Icon defaultIcon = Icon(
    Icons.home,
    color: AppColors.primaryColor,
  );

  List<Map<String, dynamic>> popupItemsList = [
    {
      'id': 0,
      'icon': const Icon(
        Icons.home,
        color: AppColors.primaryColor,
      ),
      'title': 'All List',
    },
    {
      'id': 1,
      'icon': defaultIcon,
      'title': 'Default',
    },
    {
      'id': 2,
      'icon': defaultIcon,
      'title': 'Personal',
    },
    {
      'id': 3,
      'icon': defaultIcon,
      'title': 'Shopping',
    },
    // {
    //   'id': 4,
    //   'icon': defaultIcon,
    //   'title': 'Wishlist',
    //   // 'details': [
    //   //   {'name': 'CL Wishlist', 'phNo': '09780370347'},
    //   //   {'name': 'myo lwin', 'phNo': '09780370347'}
    //   // ]
    // },
    // {
    //   'id': 5,
    //   'icon': defaultIcon,
    //   'title': 'Work',
    // },
  ];

  void updateCheckedList(List<dynamic> checkList) {
    setState(() {
      _isChecked = checkList;
      finishedList = _isChecked.where((item) => item['isFinish'] == true).toList();
      finishedCount = finishedList.isNotEmpty ? finishedList.length.toString() : "";

      print("Is check --> ${_isChecked}");

      // for(var popupItem in popupItemsList){
      //   if(popupItem['details'] != null){
      //     List<dynamic> unfinishedItems = _isChecked.where((item) => item['isFinish'] == false).toList();
      //
      //     for (var item in unfinishedItems) {
      //       if (!popupItem['details'].contains(item)) {
      //         popupItem['details'].add(item);
      //       }
      //     }
      //   }
      // }

    });
  }

  @override
  void initState() {
    super.initState();
    _changeListName('All List');
    for(var item in popupItemsList){
      /// Added List Count
      if(item['details'] != null){
        item['listCount'] = item['details'].length.toString();
        selectedDetails = item['details'];
      }
    }
  }

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
          initialValue: 'All List',
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
                      style: const TextStyle(color: AppColors.errorColor),
                    )
                        : const Text(''),
                  ),
                ),

              PopupMenuItem(
                  onTap: (){
                    setState(() {
                      selectedDetails = finishedList.isNotEmpty ? finishedList : [];
                      // _isChecked.removeWhere((item) => item['isFinish'] == true);

                      // for (var popupItem in popupItemsList) {
                      //   if (popupItem['details'] != null) {
                      //     popupItem['details'] = popupItem['details']
                      //         .where((item) => item['isFinish'] != true)
                      //         .toList();
                      //   }
                      // }
                    });
                  },
                  value: 'Finished',
                  child: ListTile(
                    leading: const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.primaryColor,
                    ),
                    title: const Text(
                      'Finished',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppDimens.fontSmall3X),
                    ),
                    trailing: Text(
                      finishedCount,
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
        callBackCheckedList: updateCheckedList,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        tooltip: 'Add',
        onPressed: () async {
          List<Map<String, dynamic>> updateList = List.from(popupItemsList)..removeWhere((item) => item['id'] == 0);

          final result = await CustomNavigationRoute.router.push('/newTask',
            extra:  NewTaskRouteParameter(popupItemsList: updateList)
          );

          if(result != null && result is Map<String, dynamic>){
            setState(() {
              bool isUpdated = false;
              for(var item in popupItemsList){
                if(item['title'] == result['title']){
                  item['id'] = popupItemsList.length + 1;
                  item['icon'] = defaultIcon;
                  item['title'] = result['title'];
                  item['details'] ??= [];
                  item['details'].add(result['newDetail']);
                  item['listCount'] = item['details'].length.toString();

                  isUpdated = true;

                  break;
                }
              }

              if(!isUpdated){
                popupItemsList.add({
                  'id': popupItemsList.length + 1,
                  'icon': defaultIcon,
                  'title': result['title'],
                  'details': [
                    result['newDetail']
                  ],
                  'listCount': '1'
                });
              }

              if(popupItemsList[0]['title'] == 'All List'){
                popupItemsList[0]['id'] = 0;
                popupItemsList[0]['icon'] = defaultIcon;
                popupItemsList[0]['title'] = popupItemsList[0]['title'];
                popupItemsList[0]['details'] ??= [];
                popupItemsList[0]['details'].add(result['newDetail']);
                popupItemsList[0]['listCount'] = popupItemsList[0]['details'].length.toString();
              }

            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white, size: AppDimens.iconLarge),
      ),
    );
  }

  _changeListName(String listName) {
    setState(() {
      selectedPopUpName = listName;
      // if(popupItemsList.first['title'] == listName){
      //   for(var item in popupItemsList){
      //     if(item['details'] != null){
      //       popupItemsList.first['listCount'] = item['details'].length.toString();
      //       selectedDetails = item['details'];
      //     }
      //   }
      // }
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => NewListDialog(
            controller: newListController,
            formKey: formKey,
          callback: (String newListName) {
            popupItemsList.add({
              'id': popupItemsList.length + 1,
              'icon': defaultIcon,
              'title': newListName,
              'details': []
            },);
        },
        )
    );
  }
}


