import 'package:flutter/material.dart';

class DataField extends StatelessWidget {
  const DataField({
    Key? key,
    required this.fieldKey,
    required this.fieldValue,
  }) : super(key: key);

  final String fieldKey;
  final String? fieldValue;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(fieldKey),
      textColor: Colors.black,
      children: [
        ListTile(
          title: fieldValue == null ? const Text('NULL') : Text(fieldValue!),
        )
      ],
    );
  }
}
