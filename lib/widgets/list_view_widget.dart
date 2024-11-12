import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  final List selectedDetails;
  const ListViewWidget({super.key, required this.selectedDetails});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.selectedDetails.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(widget.selectedDetails[index]['name']),
            subtitle: Text(widget.selectedDetails[index]['phNo']),
          );
        });
  }
}
