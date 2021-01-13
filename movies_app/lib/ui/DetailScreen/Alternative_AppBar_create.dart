import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app/ui/DetailScreen/createSnackBar.dart';

Widget alternativeAppBar(
        BuildContext context, GlobalKey<ScaffoldState> globalKey) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: IconShadowWidget(
              Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26,
              ),
              shadowColor: Colors.black,
              showShadow: true,
            ),
            onPressed: () => Navigator.pop(context)),
        IconButton(
          icon: IconShadowWidget(
            Icon(
              Icons.share,
              color: Colors.white,
              size: 26,
            ),
            shadowColor: Colors.black,
            showShadow: true,
          ),
          onPressed: () {
            createSnackBar(text: "Share", globalKey: globalKey);
          },
        ),
      ],
    );
