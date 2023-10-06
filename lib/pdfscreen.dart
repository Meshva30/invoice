import 'package:flutter/material.dart';
import 'package:invoice/utils/productname.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:printing/printing.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

    )

    );
  }
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
              pd.Text('${productName[index]}',style:pd.TextStyle(fontSize: 20,color: PdfColors.black), ),
              pd.Text('${productAmount[index]}',style:pd.TextStyle(fontSize: 20,color: PdfColors.black), ),
              pd.Text('${productQty[index]}',style:pd.TextStyle(fontSize: 20,color: PdfColors.black), ),
            ],
          ),


  ), itemCount: productName.length);
      },
    ),
  );
  await Printing.layoutPdf(onLayout: (format) async => await pdf.save());
}
