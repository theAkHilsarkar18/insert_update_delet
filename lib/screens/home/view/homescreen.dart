import 'package:flutter/material.dart';
import 'package:insert_update_delet/screens/home/model/home_model.dart';
import 'package:insert_update_delet/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

TextEditingController txtId = TextEditingController(text: "1");
TextEditingController txtName = TextEditingController(text: "T-Shirt");
TextEditingController txtPrice = TextEditingController(text: "180");

TextEditingController xtxtId = TextEditingController();
TextEditingController xtxtName = TextEditingController();
TextEditingController xtxtPrice = TextEditingController();


HomeProvider? homeProvider;

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {

    homeProvider = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Icon(Icons.all_inclusive),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Stack(
            children: [
              Consumer<HomeProvider>(
                builder: (context, value, child) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeProvider!.productData.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${homeProvider!.productData[index].id}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${homeProvider!.productData[index].name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 2)),
                            SizedBox(height: 5,),
                            Text("${homeProvider!.productData[index].price} \$",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 2)),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {

                                xtxtId = TextEditingController(text: homeProvider!.productData[index].id);
                                xtxtName = TextEditingController(text: homeProvider!.productData[index].name);
                                xtxtPrice = TextEditingController(text: homeProvider!.productData[index].price);

                                showDialog(context: context, builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize:  MainAxisSize.min,
                                    children: [

                                      SizedBox(height: 10,),

                                      TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1.5))),
                                        controller: xtxtId,
                                      ),
                                      SizedBox(height: 10,),

                                      TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1.5))),
                                        controller: xtxtName,
                                      ),

                                      SizedBox(height: 10,),
                                      TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white, width: 1.5))),
                                        controller: xtxtPrice,
                                      ),
                                      SizedBox(height: 20,),

                                      FloatingActionButton(onPressed: () {

                                        HomeModel m1 = HomeModel(id: xtxtId.text,name: xtxtName.text,price: xtxtPrice.text);
                                        homeProvider!.editData(index,m1);
                                        Navigator.pop(context);
                                      },child: Icon(Icons.edit),backgroundColor: Colors.black),



                                    ],
                                  ),

                                ),);

                              },
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {

                                homeProvider!.deleteData(index);

                              },
                              icon: Icon(Icons.delete),
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10,),

                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5))),
                              controller: txtId,
                            ),
                            SizedBox(height: 10,),

                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5))),
                              controller: txtName,
                            ),

                            SizedBox(height: 10,),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.5))),
                              controller: txtPrice,
                            ),
                            SizedBox(height: 20,),

                             FloatingActionButton(onPressed: () {

                               HomeModel m1 = HomeModel(id: txtId.text,name: txtName.text,price: txtPrice.text);
                               homeProvider!.addData(m1);
                               Navigator.pop(context);
                            },child: Icon(Icons.add),backgroundColor: Colors.black),

                          ],
                        )),
                      );
                    },
                    backgroundColor: Colors.black,
                    child: Icon(Icons.add),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
