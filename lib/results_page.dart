import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:day_8_starter/input_page.dart';

class ResultsPage extends StatelessWidget {
  String status;
  Color statuscolor;
  double result;
  String comments;
  ResultsPage(this.status,this.statuscolor,this.result,this.comments);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Your Result',textAlign: TextAlign.left, style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,)),
            ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15,right:15,bottom: 15,top: 15),
            decoration: BoxDecoration(
              color: Color(0xFF1D1F31),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(status,style: TextStyle(color: statuscolor,fontSize: 25,fontWeight: FontWeight.bold),),
                Text('${result.toStringAsFixed(2)}',style: TextStyle(fontSize:85,fontWeight: FontWeight.bold),),
                Text('Normal BMI range:',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey),),
                Text('18,5-25 kg/m2',style: TextStyle(fontSize: 20,)),
                Text(comments,style: TextStyle(fontSize: 25,),textAlign: TextAlign.center,),
                FlatButton(
                  color: Color(0xFF111328),
                  onPressed: (){},
                  child: Text('SAVE RESULT',),
                ),
              ],
            ),
          ),
        ),
            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                color: Colors.pink,
                child: Text('RE-CALCULATE YOUR BMI',
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> InputPage()));
                },
              ),
            ),
      ],
      )
    );
  }
}
