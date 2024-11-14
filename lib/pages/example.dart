// import 'package:flutter/material.dart';
// import 'package:to_do_list/navigation/custom_navigation_route.dart';
// import 'package:to_do_list/resources/app_colors.dart';
// import 'package:to_do_list/resources/app_dimens.dart';
// import 'package:to_do_list/widgets/list_view_widget.dart';
// import 'package:to_do_list/widgets/new_task_route_parameters.dart';
//
// import '../widgets/new_list_dialog.dart';
//
// class HomeScreen extends StatefulWidget {
//   final List? callBackArguments;
//   const HomeScreen({super.key, this.callBackArguments});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final formKey = GlobalKey<FormState>();
//   String selectedPopUpName = 'All List';
//   TextEditingController newListController = TextEditingController();
//   List selectedDetails = [];
//
//   List<Map<String, dynamic>> popupItemsList = [
//     {
//       'id': 0,
//       'value': 0,
//       'icon': const Icon(
//         Icons.home,
//         color: AppColors.primaryColor,
//       ),
//       'title': 'All List',
//       'details': [
//         {'name': 'CL all list', 'phNo': '09780370347'},
//         {'name': 'myo lwin', 'phNo': '09780370347'}
//       ]
//     },
//     {
//       'id': 2,
//       'value': 2,
//       'icon': const Icon(
//         Icons.format_list_bulleted,
//         color: AppColors.primaryColor,
//       ),
//       'title': 'Personal',
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _changeListName('All List');
//     for(var item in popupItemsList){
//       if(item['details'] != null){
//         item['listCount'] = item['details'].length.toString();
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: PopupMenuButton(
//           initialValue: 'All List',
//           itemBuilder: (context) {
//             return [
//               for (int i = 0; i < popupItemsList.length; i++)
//                 PopupMenuItem(
//                   onTap: () {
//                     setState(() {
//                       selectedDetails = popupItemsList[i]['details'] ?? [];
//                     });
//                   },
//                   value: popupItemsList[i]['title'],
//                   child: ListTile(
//                     leading: popupItemsList[i]['icon'],
//                     title: Text(
//                       popupItemsList[i]['title'],
//                       style: const TextStyle(
//                           color: AppColors.primaryColor,
//                           fontSize: AppDimens.fontSmall3X),
//                     ),
//                     trailing: popupItemsList[i]['listCount'] != null
//                         ? Text(
//                       popupItemsList[i]['listCount'],
//                       style: const TextStyle(color: AppColors.errorColor),
//                     )
//                         : const Text(''),
//                   ),
//                 ),
//             ];
//           },
//         ),
//       ),
//       body: selectedDetails.isEmpty
//           ? const Center(child: Text('Nothing to do'))
//           : ListViewWidget(
//         selectedDetails: selectedDetails,
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.primaryColor,
//         tooltip: 'Increment',
//         onPressed: (){
//           List<Map<String, dynamic>> updateList = List.from(popupItemsList)..removeWhere((item) => item['id'] == 0);
//           CustomNavigationRoute.router.push('/newTask',
//             extra: NewTaskRouteParameter(updateList),
//           );
//         },
//         child: const Icon(Icons.add, color: Colors.white, size: AppDimens.iconLarge),
//       ),
//     );
//   }
//
//   _changeListName(String listName) {
//     setState(() {
//       selectedPopUpName = listName;
//       if(popupItemsList.first['title'] == listName){
//         if(popupItemsList.first['details'] != null){
//           selectedDetails = popupItemsList.first['details'] ?? [];
//         }
//       }
//     });
//   }
// }
//
//
// =================
//
// class NewTaskScreen extends StatefulWidget {
//   final NewTaskRouteParameter arguments;
//   const NewTaskScreen({super.key, required this.arguments});
//
//   @override
//   State<NewTaskScreen> createState() => _NewTaskScreenState();
// }
//
// class _NewTaskScreenState extends State<NewTaskScreen> {
//   final formKey = GlobalKey<FormState>();
//   late String selectedList;
//
//   @override
//   void initState() {
//     selectedList = widget.arguments.popupItemsList[0]['title'];
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController newTaskController = TextEditingController();
//
//     String? validateNewTask(value) {
//       if (value!.isEmpty) {
//         return 'Enter Text!!';
//       } else {
//         return null;
//       }
//     }
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(AppDimens.paddingLarge),
//         child: Form(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomTextFormFieldWidget(
//                 textController: newTaskController,
//                 validator: validateNewTask,
//                 textInputType: TextInputType.text,
//                 hintTxt: 'AA',
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.primaryColor,
//         onPressed: (){
//           if(formKey.currentState!.validate()){
//             CustomNavigationRoute.router.push('/',
//                 extra: []);
//           }
//         },
//         child: const Icon(Icons.check, color: Colors.white, size: AppDimens.iconLarge),
//       ),
//     );
//   }
// }
//
