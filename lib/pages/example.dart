// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_list/navigation/custom_navigation_route.dart';
// import 'package:to_do_list/resources/app_images.dart';
// import 'package:to_do_list/resources/app_colors.dart';
// import 'package:to_do_list/resources/app_dimens.dart';
// import 'package:to_do_list/widgets/list_view_widget.dart';
//
// import '../widgets/custom_text_form_field.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
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
//   List popupItemsList = [
//     {
//       'id': 0,
//       'value': 0,
//       'icon': const Icon(
//         Icons.home,
//         color: AppColors.primaryColor,
//       ),
//       'title': 'All List',
//       'listCount': '5',
//       'details': [
//         {'name': 'CL all list', 'phNo': '09780370347'},
//         {'name': 'myo lwin', 'phNo': '09780370347'}
//       ]
//     },
//     {
//       'id': 1,
//       'value': 1,
//       'icon': const Icon(
//         Icons.format_list_bulleted,
//         color: AppColors.primaryColor,
//       ),
//       'title': 'Default',
//       'listCount': '1',
//       'details': [
//         {'name': 'CL default', 'phNo': '09780370347'},
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
//       'details': [
//         {'name': 'CL Personal', 'phNo': '09780370347'},
//         {'name': 'myo lwin', 'phNo': '09780370347'}
//       ]
//     },
//     {
//       'id': 3,
//       'value': 3,
//       'icon': const Icon(
//         Icons.format_list_bulleted,
//         color: AppColors.primaryColor,
//       ),
//       'title': 'Shopping',
//       'listCount': '1',
//       'details': [
//         {'name': 'CL Shopping', 'phNo': '09780370347'},
//         {'name': 'myo lwin', 'phNo': '09780370347'}
//       ]
//     },
//     {
//       'id': 4,
//       'value': 4,
//       'icon': const Icon(
//         Icons.format_list_bulleted,
//         color: AppColors.primaryColor,
//       ),
//       'title': 'Wishlist',
//       'details': [
//         {'name': 'CL Wishlist', 'phNo': '09780370347'},
//         {'name': 'myo lwin', 'phNo': '09780370347'}
//       ]
//     },
//     {
//       'id': 5,
//       'value': 5,
//       'icon': const Icon(
//         Icons.format_list_bulleted,
//         color: AppColors.primaryColor,
//       ),
//       'title': 'Work',
//       'listCount': '1',
//       'details': [
//         {'name': 'CL Work', 'phNo': '09780370347'},
//         {'name': 'myo lwin', 'phNo': '09780370347'}
//       ]
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: PopupMenuButton(
//             itemBuilder: (context) {
//               return [
//                 PopupMenuItem(
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         _showDialog(context);
//                       },
//                       child: const Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(right: 10),
//                             child: Icon(
//                               Icons.playlist_add_outlined,
//                               color: AppColors.grayColor,
//                             ),
//                           ),
//                           Text(
//                             'New List',
//                             style: TextStyle(
//                                 color: AppColors.grayColor,
//                                 fontSize: AppDimens.fontSmall3X),
//                           )
//                         ],
//                       ),
//                     )),
//               ];
//             },
//           ),
//         ),
//         body: selectedDetails.isEmpty
//             ? const Center(child: Text('List is Empty'))
//             : ListViewWidget(
//           selectedDetails: selectedDetails,
//         )
//     );
//   }
//
//
//   _showDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Form(
//             key: formKey,
//             child: AlertDialog(
//               shape: const RoundedRectangleBorder(
//                 borderRadius:
//                 BorderRadius.all(Radius.circular(AppDimens.borderRadius)),
//               ),
//               title: const Text(
//                 "New List",
//                 style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimens.fontMedium),
//               ),
//               content: CustomTextFormFieldWidget(
//                 textController: newListController,
//                 validator: validateNewList,
//                 textInputType: TextInputType.text,
//                 hintTxt: 'AA',
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text(
//                       "CANCEL",
//                       style: TextStyle(
//                           color: AppColors.primaryColor,
//                           fontSize: AppDimens.fontMedium),
//                     )),
//                 TextButton(
//                     onPressed: () {
//                       _submit();
//                     },
//                     child: const Text(
//                       "ADD",
//                       style: TextStyle(
//                           color: AppColors.primaryColor,
//                           fontSize: AppDimens.fontMedium),
//                     ))
//               ],
//             ),
//           );
//         });
//   }
// }
