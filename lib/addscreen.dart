import 'dart:math';

import 'package:flutter/material.dart';
import 'package:invoice/utils/productname.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtproductName = TextEditingController();
  TextEditingController txtproductQty = TextEditingController();
  TextEditingController txtproductAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff78C1F3),
        appBar: AppBar(
          title: Text(
            'Add Product',
            style: TextStyle(color: Colors.black,fontSize: 25),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_rounded, color: Colors.black),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
             txtFiledBox(txtproductName, Icon(Icons.shopping_bag,color: Colors.black), 'Product Name'),
             txtFiledBox(txtproductAmount, Icon(Icons.monetization_on_sharp,color: Colors.black), 'Product Amount'),
             txtFiledBox(txtproductQty, Icon(Icons.numbers_rounded,color: Colors.black), 'Product Qty'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: (){
            setState(() {
              int finalAmount = int.parse(txtproductQty.text)*int.parse(txtproductAmount.text);
              productName.add(txtproductName.text);
              productAmount.add(finalAmount);
              productQty.add(txtproductQty.text);
              Navigator.of(context).pushReplacementNamed('home');

            });
          },
          child: Icon(Icons.shopping_cart,color: Colors.black),
        ),
      ),
    );
  }
}
Widget txtFiledBox(TextEditingController name,Icon i1, String pname)
{
  return Padding(padding: EdgeInsets.all(10),
  child: TextField(
    controller: name,
    decoration: InputDecoration(
      labelText: pname,
      prefixIcon: i1,
      labelStyle: TextStyle(color: Colors.black,),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 2,

        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,width: 2,


        ),
      ),
    ),
  ),
  );
}