import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:day_8_starter/round_card.dart';
import 'package:day_8_starter/reuseable_card.dart';
import 'package:day_8_starter/results_page.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }
double result;
String status;
String comments ;
Color statuscolor;
const TextStyle kNumberlabelTextStyle =
    TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
const TextStyle kLabelTextStyle = TextStyle(
    fontSize: 22,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);

class _InputPageState extends State<InputPage> {
  Container dummy = Container(
    margin: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color(0xFF1D1F31),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
  );

  Gender gender;
  Color activetextcolor = Colors.white;
  Color inactivetextcolor = Colors.white60;
  Color activecardcolor = Color(0xFF1D1F31);
  Color inactivecardcolor = Color(0xFF111328);
  //double _value = 0.5;
  int changeheight = 120;
  int weight = 63;
  int age=19;

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
                  child:  ReuseableCard(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                          color: gender == Gender.male
                              ? activetextcolor
                              : inactivetextcolor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 20,
                            color: gender == Gender.male
                                ? activetextcolor
                                : inactivetextcolor,
                          ),
                        ),
                      ],
                    ),
                    color: gender == Gender.male
                        ? activecardcolor
                        : inactivecardcolor,
                    tapcallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                      print('male selected');
                    },
                  ),
                ),
                Expanded(
                  child:  ReuseableCard(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                          color: gender == Gender.female
                              ? activetextcolor
                              : inactivetextcolor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 20,
                            color: gender == Gender.female
                                ? activetextcolor
                                : inactivetextcolor,
                          ),
                        ),
                      ],
                    ),
                    color: gender == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                    tapcallback: () {
                      setState(() {
                        gender = Gender.female;
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
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text('$changeheight', style: kNumberlabelTextStyle),
                      Text('cm', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.pink,
                      overlayColor:
                          Color(0x29EB1555), // Custom Thumb overlay Color
                    ),
                    child: Slider(
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
                  child: ReuseableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text('$weight', style: kNumberlabelTextStyle),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundButton(
                              callback: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            RoundButton(
                              callback: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text('$age', style: kNumberlabelTextStyle),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundButton(
                              callback: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            RoundButton(
                              callback: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              color: Colors.pink,
              onPressed: (){
                result=weight/((changeheight/100)*(changeheight/100));
                if(result<18.5){
                  status ='UnderWeight';
                  statuscolor = Colors.red;
                  comments='Eat Eat Eat';
                }else if(result>= 18.5 && result<=25){
                  status ='Normal';
                  statuscolor = Colors.green;
                  comments='You have a normal body weight.Good job!';
                }else if(result>25){
                  status ='Obesity';
                  statuscolor = Colors.red;
                  comments='Reduce your diet and increase physical works';
                }
                Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultsPage(status,statuscolor,result,comments)));
              },
              child: Text('CALCULATE YOUR BMI',
                style: TextStyle(fontWeight: FontWeight.bold,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



