
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      title: Text("Maison à louer"),
    ),
    body: SlidingUpPanel(
      panel: Column(
        children: <Widget>[
          Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Text("Recherche"),
                 TextField(
          decoration: new InputDecoration(
            icon: new Icon(Icons.search),
            labelText: "prix une maison ...",
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.yellowAccent),
            ),
          ),
        ),
              ],)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: <Widget>[
                      filterChipWidget(chipName: 'studio americain'),
                      filterChipWidget(chipName: '2 pieces'),
                      filterChipWidget(chipName: '3 pieces'),
                      filterChipWidget(chipName: '4 pieces'),
                      filterChipWidget(chipName: 'villa'),
                      filterChipWidget(chipName: 'chateau'),
                       filterChipWidget(chipName: 'palais'),

                    ],
                  )
              ),
            ),
          ),
          Divider(color: Colors.blueGrey, height: 10.0,),
          Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _titleContainer('Choisir une commune'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: <Widget>[
                    filterChipWidget(chipName: 'abobo'),
                    filterChipWidget(chipName: 'adjame'),
                    filterChipWidget(chipName: 'cocody'),
                    filterChipWidget(chipName: 'treicheville'),
                    filterChipWidget(chipName: 'yopougon'),
                    filterChipWidget(chipName: 'bingerville'),
                  ],
                ),
              ),
            ),
          ),
          Divider(color: Colors.blueGrey, height: 10.0,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            separatorBuilder: (ctx,i){
              return Divider();
            },
            //scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (ctx, i){
              return  Card(
                clipBehavior:Clip.hardEdge,
                    elevation: 4,
                        color: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                           Container(
                              height: MediaQuery.of(context).size.height/5,
                              width: MediaQuery.of(context).size.width*0.99,
                             child:Image.asset(
                                      'assets/images/${i +1}.jpg',
                                      fit: BoxFit.cover,
                                    ),
                           ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                Text("\$"+"${1+i*20+0*i*0+122*i}"+".000.000",
                                style: TextStyle(color: Colors.black, 
                                fontSize: 24,fontWeight: FontWeight.bold),),
                              IconButton(icon: Icon(Icons.favorite_border,color: Colors.yellow,),
                              onPressed: (){},)
                              ],),
                              Text("à abobo ${1+22*i} ",style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold)),
                              Text("${1+i*20+0*i +i} BP 15 Abidjan 01"),
                            ],
                          ) ],
                        ), )
            ;
            },
          ),
        ),
      )
    ),
  );
 }
}
Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
  );
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),
      //Color(0xff6200ee)
      selected: _isSelected,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            30.0),),
      backgroundColor: Colors.grey,
      // Color(0xffededed)
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.blueGrey,);
      //Color(0xffeadffd)
  }
}
