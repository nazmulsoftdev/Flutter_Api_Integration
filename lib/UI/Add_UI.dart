import 'package:app2/helper/Post_helper.dart';
import 'package:flutter/material.dart';

AddUI( _controllerID, _controllerName, _controllerGender) {
  return Container(
    child: Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: _controllerID,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "ID", border: InputBorder.none),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: _controllerName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Name", border: InputBorder.none),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: _controllerGender,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Gender", border: InputBorder.none),
            ),
          ),
        ),

      ],
    ),
  );
}
