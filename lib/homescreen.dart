//pd.ListView.builder(itemBuilder: (context, index) => pd.Container(
  //        height: 80,
    //      width: double.infinity,
      //    padding: pd.EdgeInsets.all(10),
        //  margin: pd.EdgeInsets.all(10),
          //decoration: pd.BoxDecoration(
            //border: pd.Border.all(color: PdfColors.black,width: 1.5,),
          //),
          //child: pd.Row(
           // mainAxisAlignment: pd.MainAxisAlignment.spaceEvenly,
            //children: [
             // pd.Text('${productName[index]}',style:pd.TextStyle(fontSize: 20,), ),
              //pd.Text('${productAmount[index]}',style:pd.TextStyle(fontSize: 20,), ),
              //pd.Text('${productQty[index]}',style:pd.TextStyle(fontSize: 20,), ),
            //],
          //),

import 'package:flutter/material.dart';
import 'package:invoice/pdfscreen.dart';
import 'package:invoice/utils/productname.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:printing/printing.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      print("reload");

    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff78C1F3),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () async {
              await generatePdf();

              },icon: Icon(Icons.picture_as_pdf,color: Colors.black,)),
          ],
          title: Text('Home Screen', style: TextStyle(color: Colors.black,fontSize: 25,)),
          leading: Icon(Icons.menu, color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ProductBox(index),
          itemCount: productName.length,),
         floatingActionButton: FloatingActionButton(
           backgroundColor: Colors.blue,
           onPressed: (){
             Navigator.of(context).pushReplacementNamed('add');
           },
           child: Icon(Icons.add,color: Colors.black),
         ),
      ),
    );
  }
}
Widget ProductBox(int index)
{
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(10),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border:   Border.all(color: Colors.black,width: 2),

    ),
child: ListTile(
  leading: Text('${productName[index]}',style: TextStyle(fontSize: 18)),
  title: Text('${productQty[index]}Qty',style: TextStyle(fontSize: 18)),
  trailing: Text('${productAmount[index]}/-',style: TextStyle(fontSize: 18)),

),
  );
}
final pdf=pd.Document();
generatePdf() async{
  pdf.addPage(
    pd.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pd.ListView.builder(itemBuilder: (context, index) => pd.Container(
          height: 80,
          width: double.infinity,
          padding: pd.EdgeInsets.all(10),
          margin: pd.EdgeInsets.all(10),
          decoration: pd.BoxDecoration(
            border: pd.Border.all(color: PdfColors.black,width: 1.5,),
          ),
          child: pd.Row(
            mainAxisAlignment: pd.MainAxisAlignment.spaceEvenly,
            children: [
              pd.Text('${productName[index]}',style:pd.TextStyle(fontSize: 20,), ),
              pd.Text('${productAmount[index]}',style:pd.TextStyle(fontSize: 20,), ),
              pd.Text('${productQty[index]}',style:pd.TextStyle(fontSize: 20,), ),
            ],
          ),


        ), itemCount: productName.length);
      },
    ),
  );
  await Printing.layoutPdf(onLayout: (format) async => await pdf.save());
}
