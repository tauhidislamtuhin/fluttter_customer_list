import 'package:flutter/material.dart';

class CustomDetailsRow extends StatelessWidget {
  final String? title;
  final String? value;
  const CustomDetailsRow({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ",
              style: const TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 15, color: Colors.black87)),
          Expanded(
            child: Text(
              value?.isNotEmpty == true ? value! : 'N/A',
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
