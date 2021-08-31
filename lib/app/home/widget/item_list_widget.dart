import 'package:app_teste/app/models/item_model.dart';
import 'package:app_teste/app/services/convert_data.dart';
import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final ItemModel item;
  const ItemListWidget({ Key? key, required this.item }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              offset: Offset(1,1),
              blurRadius: 3,
              spreadRadius: 1,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Guid: ${item.guid}"),
              Text(convertData(item.date)),
              Text("Text: ${item.text}"),
            ],
          ),
        ),
      ),
    );
  }
}