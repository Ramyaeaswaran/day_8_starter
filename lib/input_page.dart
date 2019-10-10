import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Container dummy = Container(
    margin: EdgeInsets.all(12),
    decoration: BoxDecoration(

      color: Color(0xFF1D1F31),
      borderRadius: BorderRadius.all(Radius.circular(12),),),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReuseableCard(
                    child: Column(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars,size: 120,),
                        Text('MALE',style: TextStyle(fontSize:20 ),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:  new ReuseableCard(
                    child: Column(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.venus,size: 120,),
                        Text('FEMALE',style: TextStyle(fontSize:20 ),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:  ReuseableCard(),
                ),
                Expanded(
                  child: ReuseableCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReuseableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  ReuseableCard({this.color = const Color(0xFF1D1F31),this.child});
 // const ReuseableCard({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(12),),),
      child: child,
    );
  }
}