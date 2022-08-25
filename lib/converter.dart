// ignore_for_file:  sort_child_properties_last, prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables
import 'dart:math';

import 'package:calculatrice/constants.dart';
import 'package:calculatrice/history.dart';
import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  Converter({Key? key, required this.light, required this.listConvertions})
      : super(key: key);
  final bool light;
  List<String> listConvertions;
  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  List<String> listSections = ["Distance", "Volume", "Area"];
  bool toTheSecondSection = true;
  String firstSection = "0";
  String secondSection = "0";
  double sectionHeight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(widget.light),
      appBar: AppBar(
        title: Text(
          "Converter",
          style: TextStyle(
            color: textColor(widget.light),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: backgroundColor(widget.light),
        iconTheme: iconAppBarTheme,
        actions: [
          IconButton(
            splashRadius: 25,
            icon: Icon(
              Icons.history,
              color: buttonColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ConvertionHistory(
                          light: widget.light,
                          listConvertions: widget.listConvertions),
                  transitionsBuilder:
                      (context, animation, secondaryAnmation, child) {
                    var tween =
                        Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                            .chain(CurveTween(curve: Curves.linear));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),

      //BODY
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 25 + 60),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            Text(
                              listSections[0] == "Distance"
                                  ? "Meter"
                                  : listSections[0] == "Volume"
                                      ? "Liter"
                                      : "Square Meter",
                              style:
                                  TextStyle(color: buttonColor, fontSize: 16),
                            ),
                            Icon(Icons.arrow_drop_down,
                                color: buttonColor, size: 25),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: buttonColor,
                          boxShadow: [
                            BoxShadow(
                              color: backgroundColor(widget.light)
                                  .withOpacity(0.2),
                              offset: -Offset(10, 10),
                              blurRadius: 10.0,
                            ),
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4, 4),
                              blurRadius: 7.0,
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          margin: EdgeInsets.all(2),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: backgroundColor(widget.light),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SingleChildScrollView(
                            primary: false,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              firstSection,
                              style: TextStyle(color: textColor(widget.light)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      AnimatedRotation(
                        duration: Duration(milliseconds: 750),
                        turns: toTheSecondSection ? 0 : -1 / 2,
                        child: IconButton(
                            icon: Icon(Icons.arrow_downward,
                                color: buttonColor, size: 25),
                            onPressed: () {
                              setState(() {
                                toTheSecondSection = !toTheSecondSection;
                                if (toTheSecondSection) {
                                  firstSection = "";
                                  secondSection = "0";
                                } else {
                                  firstSection = "0";
                                  secondSection = "";
                                }
                              });
                            }),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 17),
                        child: Row(
                          children: [
                            Text(
                              listSections[0] == "Distance"
                                  ? "Kilometer"
                                  : listSections[0] == "Volume"
                                      ? "Cubic Meter"
                                      : "Hectare",
                              style:
                                  TextStyle(color: buttonColor, fontSize: 16),
                            ),
                            Icon(Icons.arrow_drop_down,
                                color: buttonColor, size: 25),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: buttonColor,
                          boxShadow: [
                            BoxShadow(
                              color: backgroundColor(widget.light)
                                  .withOpacity(0.2),
                              offset: -Offset(10, 10),
                              blurRadius: 10.0,
                            ),
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4, 4),
                              blurRadius: 7.0,
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          margin: EdgeInsets.all(2),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: backgroundColor(widget.light),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SingleChildScrollView(
                            primary: false,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              secondSection,
                              style: TextStyle(color: textColor(widget.light)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    width: double.infinity,
                    height: sectionHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: backgroundColor(widget.light),
                      boxShadow: [
                        BoxShadow(
                          color: backgroundColor(widget.light).withOpacity(0.2),
                          offset: -Offset(10, 10),
                          blurRadius: 10.0,
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(4, 4),
                          blurRadius: 7.0,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      primary: true,
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 13),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (sectionHeight == 60) {
                                  sectionHeight *= 3;
                                } else {
                                  sectionHeight = 60;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          listSections[0],
                                          softWrap: true,
                                          style: TextStyle(
                                              color: textColor(widget.light)),
                                        ),
                                      ),
                                      Icon(
                                        sectionHeight == 60
                                            ? Icons.arrow_drop_down_sharp
                                            : Icons.arrow_drop_up_sharp,
                                        color: textColor(widget.light),
                                        size: 35,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6),
                              ],
                            ),
                          ),
                          Divider(
                            color:
                                backgroundColor(!widget.light).withOpacity(0.5),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                String str = listSections[0];
                                listSections[0] = listSections[1];
                                listSections[1] = str;
                                sectionHeight = 60;
                                if (toTheSecondSection) {
                                  firstSection = "";
                                  secondSection = "0";
                                } else {
                                  firstSection = "0";
                                  secondSection = "";
                                }
                              });
                            },
                            child: Column(
                              children: [
                                SizedBox(height: 5),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          listSections[1],
                                          softWrap: true,
                                          style: TextStyle(
                                              color: textColor(widget.light)),
                                        ),
                                      ),
                                      Icon(
                                        sectionHeight == 60
                                            ? Icons.arrow_drop_down_sharp
                                            : Icons.arrow_drop_up_sharp,
                                        color: Colors.transparent,
                                        size: 35,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color:
                                backgroundColor(!widget.light).withOpacity(0.5),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                String str = listSections[0];
                                listSections[0] = listSections[2];
                                listSections[2] = str;
                                sectionHeight = 60;
                                if (toTheSecondSection) {
                                  firstSection = "";
                                  secondSection = "0";
                                } else {
                                  firstSection = "0";
                                  secondSection = "";
                                }
                              });
                            },
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          listSections[2],
                                          softWrap: true,
                                          style: TextStyle(
                                              color: textColor(widget.light)),
                                        ),
                                      ),
                                      Icon(
                                        sectionHeight == 60
                                            ? Icons.arrow_drop_down_sharp
                                            : Icons.arrow_drop_up_sharp,
                                        color: Colors.transparent,
                                        size: 35,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Column(
                    children: [
                      buttonBuilder("7", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("4", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("1", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("00", textColor(widget.light)),
                    ],
                  ),
                  SizedBox(width: 13),
                  Column(
                    children: [
                      buttonBuilder("8", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("5", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("2", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("0", textColor(widget.light)),
                    ],
                  ),
                  SizedBox(width: 13),
                  Column(
                    children: [
                      buttonBuilder("9", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("6", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder("3", textColor(widget.light)),
                      SizedBox(height: 10),
                      buttonBuilder(".", textColor(widget.light)),
                    ],
                  ),
                  SizedBox(width: 13),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (toTheSecondSection) {
                              firstSection = "";
                              secondSection = "0";
                            } else {
                              firstSection = "0";
                              secondSection = "";
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(17),
                        splashColor:
                            backgroundColor(!widget.light).withOpacity(0.8),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: backgroundColor(widget.light),
                            boxShadow: [
                              BoxShadow(
                                color: backgroundColor(widget.light)
                                    .withOpacity(0.2),
                                offset: -Offset(10, 10),
                                blurRadius: 10.0,
                              ),
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(10, 10),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          width: 60,
                          height: 60 + 60 + 60 + 10 + 10,
                          padding: EdgeInsets.only(left: 13, top: 10),
                          child: Text(
                            "AC",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            String str = toTheSecondSection
                                ? firstSection
                                : secondSection;
                            toTheSecondSection
                                ? firstSection = ""
                                : secondSection = "";
                            for (int i = 0; i < str.length - 1; i++) {
                              toTheSecondSection
                                  ? firstSection += str[i]
                                  : secondSection += str[i];
                            }
                            calculFunction();
                          });
                        },
                        borderRadius: BorderRadius.circular(17),
                        splashColor:
                            backgroundColor(!widget.light).withOpacity(0.8),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: backgroundColor(widget.light),
                            boxShadow: [
                              BoxShadow(
                                color: backgroundColor(widget.light)
                                    .withOpacity(0.2),
                                offset: -Offset(10, 10),
                                blurRadius: 10.0,
                              ),
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(10, 10),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Icon(
                              Icons.backspace,
                              color: buttonColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 10),
                      // buttonBuilder("=", textColor(widget.light)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonBuilder(String _label, Color _color) {
    Offset distance = Offset(10, 10);
    double blur = 10.0;
    return InkWell(
      onTap: () {
        setState(() {
          if (toTheSecondSection) {
            secondSection = "";
            firstSection += _label;
          } else {
            firstSection = "";
            secondSection += _label;
          }
          calculFunction();
        });
      },
      borderRadius: BorderRadius.circular(17),
      splashColor: backgroundColor(!widget.light).withOpacity(0.8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: backgroundColor(widget.light),
          boxShadow: [
            BoxShadow(
              color: backgroundColor(widget.light).withOpacity(0.2),
              offset: -distance,
              blurRadius: blur,
            ),
            BoxShadow(
              color: Colors.black26,
              offset: distance,
              blurRadius: blur,
            ),
          ],
        ),
        width: 60,
        height: 60,
        child: Center(
          child: Text(
            _label,
            style: TextStyle(
              color: _color,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  void calculFunction() {
    if (listSections[0] == "Distance") {
      if (toTheSecondSection && double.tryParse(firstSection) != null) {
        secondSection = (double.tryParse(firstSection)! / 1000).toString();
        widget.listConvertions.insert(0, "$firstSection->$secondSection");
      } else if (toTheSecondSection && double.tryParse(firstSection) == null) {
        secondSection = "0";
      } else if (!toTheSecondSection &&
          double.tryParse(secondSection) != null) {
        firstSection = (double.tryParse(secondSection)! * 1000).toString();
        widget.listConvertions.insert(0, "$secondSection->$firstSection");
      } else if (!toTheSecondSection &&
          double.tryParse(secondSection) == null) {
        firstSection = "0";
      }
    }
    if (listSections[0] == "Area") {
      if (toTheSecondSection && double.tryParse(firstSection) != null) {
        secondSection = (double.tryParse(firstSection)! / 10000).toString();
        widget.listConvertions.insert(0, "$firstSection->$secondSection");
      } else if (toTheSecondSection && double.tryParse(firstSection) == null) {
        secondSection = "0";
      } else if (!toTheSecondSection &&
          double.tryParse(secondSection) != null) {
        firstSection = (double.tryParse(secondSection)! * 10000).toString();
        widget.listConvertions.insert(0, "$secondSection->$firstSection");
      } else if (!toTheSecondSection &&
          double.tryParse(secondSection) == null) {
        firstSection = "0";
      }
    }
    if (listSections[0] == "Volume") {
      if (toTheSecondSection && double.tryParse(firstSection) != null) {
        secondSection = (double.tryParse(firstSection)! / 1000).toString();
        widget.listConvertions.insert(0, "$firstSection->$secondSection");
      } else if (toTheSecondSection && double.tryParse(firstSection) == null) {
        secondSection = "0";
      } else if (!toTheSecondSection &&
          double.tryParse(secondSection) != null) {
        firstSection = (double.tryParse(secondSection)! * 1000).toString();
        widget.listConvertions.insert(0, "$secondSection->$firstSection");
      } else if (!toTheSecondSection &&
          double.tryParse(secondSection) == null) {
        firstSection = "0";
      }
    }
  }
}
