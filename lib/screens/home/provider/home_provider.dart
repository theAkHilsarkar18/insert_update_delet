
import 'package:flutter/material.dart';
import 'package:insert_update_delet/screens/home/model/home_model.dart';

class HomeProvider extends ChangeNotifier
{

  List<HomeModel> productData = [];

  void addData(HomeModel m1)
  {
    productData.add(m1);
    notifyListeners();
  }

  void editData(int index,HomeModel m1)
  {
    productData[index] = m1;
    notifyListeners();
  }

  void deleteData(int index)
  {
    productData.removeAt(index);
    notifyListeners();
  }

}