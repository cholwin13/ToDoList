import 'package:flutter/material.dart';
import 'package:to_do_list/resources/app_colors.dart';
import 'package:to_do_list/resources/app_dimens.dart';

class ListViewWidget extends StatefulWidget {
  final List selectedDetails;
  final Function(List<dynamic>)? callBackCheckedList;
  const ListViewWidget({super.key, required this.selectedDetails, this.callBackCheckedList});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.selectedDetails.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: AppColors.secondaryColor,
              child: ListTile(
                leading: Checkbox(
                  value: index < widget.selectedDetails.length ? widget.selectedDetails[index]['isFinish'] : false,
                  onChanged: (bool? newValue) {
                    setState(() {
                      if (index < widget.selectedDetails.length) {
                        widget.selectedDetails[index]['isFinish'] = newValue!;
                      }
                      setState(() {
                        widget.callBackCheckedList!(widget.selectedDetails);
                      });
                    });
                  },
                  activeColor: AppColors.whiteColor,
                  checkColor: AppColors.primaryColor,
                ),
                title: Text(widget.selectedDetails[index]['name']),
                subtitle: Text(widget.selectedDetails[index]['phNo']),
                textColor: AppColors.whiteColor,
                titleTextStyle: const TextStyle(
                  fontSize: AppDimens.fontMedium
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: AppDimens.fontSmall
                ),
              ),
            ),
          );
        });
  }
}
