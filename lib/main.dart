

import 'package:flutter/material.dart';
import 'package:insert_update_delet/screens/home/provider/home_provider.dart';
import 'package:insert_update_delet/screens/home/view/homescreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Homescreen(),
        },
      ),
    ),
  );
}