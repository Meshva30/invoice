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
            IconButton(
                onPressed: () async {
                  await generatePdf();
                  for (int i = 0; i < productAmount.length; i++) {
                    total = total + productAmount[i];
                  }
                },
                icon: Icon(
                  Icons.picture_as_pdf,
                  color: Colors.black,
                )),
          ],
          title: Text('Home Screen',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              )),
          leading: Icon(Icons.menu, color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ProductBox(index),
          itemCount: productName.length,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('add');
          },
          child: Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}

Widget ProductBox(int index) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(10),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black, width: 2),
    ),
    child: ListTile(
      leading: Text('${productName[index]}', style: TextStyle(fontSize: 18)),
      title: Text('${productQty[index]}Qty', style: TextStyle(fontSize: 18)),
      trailing:
          Text('${productAmount[index]}/-', style: TextStyle(fontSize: 18)),
    ),
  );
}

final pdf = pd.Document();

generatePdf() async {
  final netImage = await networkImage('https://cdn2.vectorstock.com/i/1000x1000/31/01/complete-payment-rubber-stamp-vector-12443101.jpg');

  pdf.addPage(pd.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        var index;
        return pd.Container(
          height: double.infinity,
          width: double.infinity,
          child: pd.Column(children: [
            pd.Container(
              width: double.infinity,
              height: 17,
              alignment: pd.Alignment.center,
              child: pd.Text(
                'Bridal Studio',
                style: pd.TextStyle(
                    color: PdfColors.black,
                    fontSize: 40,
                    fontWeight: pd.FontWeight.bold),
              ),
            ),
            pd.SizedBox(height: 30),
            pd.Container(
              alignment: pd.Alignment.centerLeft,
              child: pd.Text(
                'Marriage Shopping',
                style: pd.TextStyle(
                  color: PdfColors.black,
                  fontSize: 30,
                ),
              ),
            ),
            pd.SizedBox(height: 10),
            pd.Container(
              alignment: pd.Alignment.centerLeft,
              child: pd.Text(
                'NAME : Meshva Patel',
                style: pd.TextStyle(
                  color: PdfColors.black,
                  fontSize: 25,
                ),
              ),
            ),
            pd.Container(
              alignment: pd.Alignment.centerLeft,
              child: pd.Text(
                'MOBILE : 9313220217',
                style: pd.TextStyle(
                  color: PdfColors.black,
                  fontSize: 25,
                ),
              ),
            ),
            pd.SizedBox(height: 50),
            pd.Container(
              width: double.infinity,
              child: pd.Row(children: [
                pd.Container(
                  alignment: pd.Alignment.center,
                  height: 50,
                  width: 130,
                  color: PdfColors.grey,
                  child: pd.Text('Product',
                      style: pd.TextStyle(
                          color: PdfColors.black,
                          fontSize: 15,
                          fontWeight: pd.FontWeight.bold)),
                ),
                pd.SizedBox(width: 5),
                pd.Container(
                  alignment: pd.Alignment.center,
                  height: 50,
                  width: 130,
                  color: PdfColors.grey,
                  child: pd.Text('Price',
                      style: pd.TextStyle(
                          color: PdfColors.black,
                          fontSize: 15,
                          fontWeight: pd.FontWeight.bold)),
                ),
                pd.SizedBox(width: 5),
                pd.Container(
                  alignment: pd.Alignment.center,
                  height: 50,
                  width: 50,
                  color: PdfColors.grey,
                  child: pd.Text('QTY',
                      style: pd.TextStyle(
                          color: PdfColors.black,
                          fontSize: 15,
                          fontWeight: pd.FontWeight.bold)),
                ),
                pd.SizedBox(width: 5),
                pd.Container(
                  alignment: pd.Alignment.center,
                  height: 50,
                  width: 50,
                  color: PdfColors.grey,
                  child: pd.Text('TAX',
                      style: pd.TextStyle(
                          color: PdfColors.black,
                          fontSize: 15,
                          fontWeight: pd.FontWeight.bold)),
                ),
                pd.SizedBox(width: 5),
                pd.Container(
                  alignment: pd.Alignment.center,
                  height: 50,
                  width: 130,
                  color: PdfColors.grey,
                  child: pd.Text('Amount',
                      style: pd.TextStyle(
                          color: PdfColors.black,
                          fontSize: 15,
                          fontWeight: pd.FontWeight.bold)),
                ),
              ]),
            ),
            pd.SizedBox(width: 20),
            pd.Row(children: [
              pd.Column(children: [
                pd.Text('Blazer',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('Lehenga',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('Kurta',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('Chaniya choli',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('Tisat',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
              ]),
              pd.SizedBox(width: 90),
              pd.Column(children: [
                pd.Text('1750',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('18000',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('800',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('5000',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('1800',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
              ]),
              pd.SizedBox(width: 65),
              pd.Column(children: [
                pd.Text('1',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('1',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('12',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('2',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('2',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
              ]),
              pd.SizedBox(width: 40),
              pd.Column(children: [
                pd.Text('18%',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('18%',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('18%',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('18%',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('18%',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
              ]),
              pd.SizedBox(width: 45),
              pd.Column(children: [
                pd.Text('2065.0',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('21240.0',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('944.0',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('5900.0',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
                pd.Text('2124.0',
                    style: pd.TextStyle(color: PdfColors.black, fontSize: 15)),
                pd.SizedBox(height: 10),
              ])
            ]),
            pd.Text(
                '-------------------------------------------------------------------------------------------------------------------------'),
            pd.SizedBox(width: 800),
            pd.Container(
              alignment: pd.Alignment.center,
              height: 50,
              width: 50,
              decoration: pd.BoxDecoration(color: PdfColors.grey),
              child: pd.Text('18',
                  style: pd.TextStyle(color: PdfColors.black, fontSize: 20)),
            ),
            pd.SizedBox(height: 20,width: 50),
            pd.Container(
              alignment: pd.Alignment.center,
              height: 50,
              width: 150,
              decoration: pd.BoxDecoration(color: PdfColors.grey),
              child: pd.Text('Total Amount 27350.0/-',
                  style: pd.TextStyle(color: PdfColors.black, fontSize: 20)),
            ),
               pd.SizedBox(height: 20),
          pd.Container(
              height: 150,
              width: 150,
              child: pd.Image(
                netImage,
              ),
            ),
          ]),

        );
      }));
  await Printing.layoutPdf(onLayout: (format) async => await pdf.save());
}
