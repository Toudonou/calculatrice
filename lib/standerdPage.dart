// ignore_for_file:  sort_child_properties_last, prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers

import 'package:calculatrice/constants.dart';
import 'package:calculatrice/history.dart';
import 'package:calculatrice/options.dart';
import 'package:flutter/material.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:math_expressions/math_expressions.dart';

class StanderdPage extends StatefulWidget {
  StanderdPage(
      {Key? key,
      required this.light,
      required this.listCalculs,
      required this.listConvertions})
      : super(key: key);
  bool light;
  List<String> listCalculs;
  final List<String> listConvertions;
  @override
  State<StanderdPage> createState() => _StanderdPageState();
}

class _StanderdPageState extends State<StanderdPage> {
  String textCalcul = "";
  String error = "";
  String lastButtonText = "";
  @override
  Widget build(BuildContext context) {
    //textCalcul = separationFunction(textCalcul);
    return Scaffold(
      backgroundColor: backgroundColor(widget.light),
      appBar: AppBar(
        backgroundColor: backgroundColor(widget.light),
        leading: IconButton(
          splashRadius: 25,
          icon: Icon(
            Icons.menu,
            color: buttonColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Options(
                  light: widget.light,
                  index: 1,
                  listConvertions: widget.listConvertions,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnmation, child) {
                  var tween =
                      Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
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
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: backgroundColor(widget.light).withOpacity(0.5),
            boxShadow: [
              BoxShadow(
                offset: Offset(7, 5),
                blurRadius: 6.0,
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
          child: Switcher(
            value: widget.light,
            size: SwitcherSize.medium,
            switcherRadius: 50,
            switcherButtonRadius: 50,
            enabledSwitcherButtonRotate: true,
            animationDuration: Duration(milliseconds: 400),
            iconOff: Icons.dark_mode_outlined,
            iconOn: Icons.sunny,
            switcherButtonColor: backgroundColor(!widget.light),
            colorOff: backgroundColor(widget.light),
            colorOn: backgroundColor(widget.light),
            onChanged: (bool state) {
              Future.delayed(Duration.zero, () {
                setState(() {
                  widget.light = state;
                });
              });
            },
          ),
        ),
        centerTitle: true,
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
                      CalculHistory(
                          light: widget.light, listCalculs: widget.listCalculs),
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
        elevation: 0.0,
      ),

      //BODY
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    error,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: SingleChildScrollView(
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        textCalcul.toString(),
                        style: TextStyle(
                          color: textColor(widget.light),
                          fontSize: 45,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SizedBox(width: 24),
                    InkWell(
                      onTap: () {
                        setState(() {
                          textCalcul = "";
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
                          child: Text(
                            "AC",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    buttonBuilder("÷", buttonColor),
                    SizedBox(width: 24),
                    buttonBuilder("×", buttonColor),
                    SizedBox(width: 24),
                    InkWell(
                      onTap: () {
                        setState(() {
                          String str = textCalcul;
                          textCalcul = "";
                          for (int i = 0; i < str.length - 1; i++) {
                            textCalcul += str[i];
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
                        height: 60,
                        child: Center(
                            child: Icon(
                          Icons.backspace_outlined,
                          color: buttonColor,
                          size: 25,
                        )),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 24),
                    buttonBuilder("7", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("8", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("9", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("%", buttonColor),
                    SizedBox(width: 24),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 24),
                    buttonBuilder("4", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("5", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("6", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("-", buttonColor),
                    SizedBox(width: 24),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 24),
                    buttonBuilder("1", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("2", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("3", textColor(widget.light)),
                    SizedBox(width: 24),
                    buttonBuilder("+", buttonColor),
                    SizedBox(width: 24),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 24),
                    InkWell(
                      onTap: () {
                        setState(() {
                          textCalcul += "0";
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
                                  .withOpacity(0.8),
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
                        width: 120 + 24,
                        height: 60,
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "0",
                            style: TextStyle(
                              color: textColor(widget.light),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    buttonBuilder(".", textColor(widget.light)),
                    SizedBox(width: 24),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lastButtonText = "=";
                          equalPressed();
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
                          child: Text(
                            "=",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonBuilder(String _label, Color _color) {
    Offset distance = Offset(10, 10);
    double blur = 10.0;
    return InkWell(
      onTap: () {
        setState(() {
          error = "";
          List<String> operatorList = ["×", "+", "-", "÷"];
          if (textCalcul.length == 1 && textCalcul[0] == ".") {
            if ((_label != "%" &&
                _label != "." &&
                _label != "×" &&
                _label != "÷" &&
                _label != "+" &&
                _label != "-")) {
              textCalcul = "0.$_label";
            }
          } else if (textCalcul.isNotEmpty &&
              operatorList.contains(textCalcul[textCalcul.length - 1]) &&
              operatorList.contains(_label)) {
            textCalcul = textCalcul;
          } else if (textCalcul.isNotEmpty &&
              ["×", "+", "-", "÷", "%"]
                  .contains(textCalcul[textCalcul.length - 1]) &&
              !["×", "+", "-", "÷", "%"].contains(_label)) {
            textCalcul += _label;
          } else {
            if (lastButtonText == "=" && error == "") {
              textCalcul = _label;
            } else {
              textCalcul += _label;
            }
          }

          lastButtonText = _label;
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

  String separationFunction(String chaine) {
    String stock = chaine.replaceAll(" ", "");
    int j = 0;
    chaine = "";
    for (int i = stock.length - 1; i >= 0; i--) {
      chaine = stock[i] + chaine;
      j++;

      if (stock[i] == "+" ||
          stock[i] == "-" ||
          stock[i] == "×" ||
          stock[i] == "÷" ||
          stock[i] == "%" ||
          stock[i] == ".") {
        j = 0;
      }
      if (j % 3 == 0 && j != 0) {
        chaine = " $chaine";
      }
    }
    return chaine;
  }

  void equalPressed() {
    String finaluserinput = textCalcul;
    String preAnswer;
    List<String> listException = ["NaN", "Infinity"];
    finaluserinput = textCalcul.replaceAll('×', '*');
    finaluserinput = finaluserinput.replaceAll('÷', '/');
    finaluserinput = finaluserinput.replaceAll(',', '.');
    finaluserinput = finaluserinput.replaceAll('%', '*(1/100)');
    Parser p = Parser();
    try {
      Expression expression = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);

      preAnswer = eval.toString();

      String stock = preAnswer;
      preAnswer = "";
      for (int i = 0; i < stock.length; i++) {
        if (stock[i] == "." && stock[stock.length - 1] == "0") {
          break;
        }
        preAnswer = preAnswer + stock[i];
      }
      // preAnswer = preAnswer.replaceAll('.', ',');
      error = "";
      for (var i in listException) {
        if (preAnswer == i) {
          error = "Error";
          preAnswer = "";
          break;
        }
      }
      if (preAnswer != "") {
        widget.listCalculs.insert(0, textCalcul);
        textCalcul = preAnswer;
      } else {}
    } catch (e) {
      setState(() {
        error = "Error";
        textCalcul = textCalcul;
      });
    }
  }
}
