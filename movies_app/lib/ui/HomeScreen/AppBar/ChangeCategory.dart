import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/offlineData/local_Variables.dart';

class ChangeCategory extends StatefulWidget {
  ChangeCategory({Key key}) : super(key: key);

  @override
  _ChangeCategoryState createState() => _ChangeCategoryState();
}

class _ChangeCategoryState extends State<ChangeCategory> {
 static String dropdownValue;


  @override
  Widget build(BuildContext context) {
    if (dropdownValue == null) dropdownValue = categoriesNames[0];

    return PopupMenuButton(

      icon: Icon(
        CupertinoIcons.ellipsis_vertical,
        color: Colors.white,
      ),
      initialValue: dropdownValue,
      itemBuilder: (context) {
        
        // ignore: non_constant_identifier_names
        return categoriesNames.map((Value) {
          return PopupMenuItem(value: Value, child: Text(Value));
        }).toList();
      },
      onSelected: (selectedValue) async {
      int  index = categoriesNames.indexOf(selectedValue);//to get the index of the value then use it to reload data
        // print(index);//
        setState(() {
          dropdownValue = selectedValue;
          tabController.index=index;

        });

      },
      onCanceled: () {},
    );
  }
}
