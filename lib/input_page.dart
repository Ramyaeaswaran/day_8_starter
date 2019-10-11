import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  male,female
}
class _InputPageState extends State<InputPage> {
  Container dummy = Container(
    margin: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color(0xFF1D1F31),
      borderRadius: BorderRadius.all(Radius.circular(12),),),
  );
  Gender gender;
  Color activetextcolor= Colors.white;
  Color inactivetextcolor = Colors.white60;
  Color activecardcolor= Color(0xFF1D1F31);
  Color inactivecardcolor= Color(0xFF111328);
  double _value = 0.5;
  int changeheight=120;
  @override
  Widget build(BuildContext context) {
  // Color backgroundcolormale =inactivecardcolor;
  // Color backgroundcolorfemale =inactivecardcolor;
  // if(gender==0) {
  //   backgroundcolormale = activecardcolor;
  // }else if(gender ==1){
  //   backgroundcolorfemale =activecardcolor;
  // }
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
                        Icon(FontAwesomeIcons.mars,size: 100,
                          color:gender ==Gender.male ? activetextcolor : inactivetextcolor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('MALE',style: TextStyle(fontSize:20, color:gender ==Gender.male ? activetextcolor : inactivetextcolor, ),),
                      ],
                    ),
                    color:gender ==Gender.male ? activecardcolor : inactivecardcolor,
                    tapcallback:(){
                      setState(() {
                        gender=Gender.male;
                      });
                      print('male selected');
                      },
                  ),
                ),
                Expanded(
                  child:  new ReuseableCard(
                    child: Column(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.venus,size:100,
                          color:gender ==Gender.female ? activetextcolor : inactivetextcolor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('FEMALE',style: TextStyle(fontSize:20,color:gender ==Gender.female ? activetextcolor : inactivetextcolor,),
                          ),
                      ],
                    ),
                    color:gender ==Gender.female ? activecardcolor : inactivecardcolor,
                    tapcallback:(){
                      setState(() {
                        gender=Gender.female;
                      });
                      print('female selected');
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: TextStyle(color: Colors.white70,fontSize:20)),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: <Widget>[
                 Text('$changeheight', style: TextStyle(fontSize:40,fontWeight: FontWeight.bold)),
                 Text('cm', style: TextStyle(fontSize:15)),
                ],
               ),
               SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Colors.pink,
                  overlayColor: Color(0x29EB1555),  // Custom Thumb overlay Color
                ),
                child :Slider(
                  min: 110,
                  max: 250,
                value: changeheight.toDouble(),
                onChanged: (double newValue) {
                  setState(() {
                    changeheight = newValue.round();
                  });
                },
              ),
              ),
                    ],
              ),
            ),
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
  final Function tapcallback;
  ReuseableCard({this.color = const Color(0xFF1D1F31),this.child,this.tapcallback,});
 // const ReuseableCard({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:tapcallback ,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(12),),),
        child: child,
      ),
    );
  }
}