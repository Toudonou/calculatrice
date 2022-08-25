// ignore_for_file:  sort_child_properties_last, prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables

import 'package:calculatrice/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculHistory extends StatefulWidget {
  CalculHistory({Key? key, required this.light, required this.listCalculs})
      : super(key: key);
  final bool light;
  final List<String> listCalculs;
  @override
  State<CalculHistory> createState() => _CalculHistoryState();
}

class _CalculHistoryState extends State<CalculHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(widget.light),
      appBar: AppBar(
        title: Text(
          "History",
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
      ),

      //BODY
      body: ListView.builder(
        primary: false,
        itemCount: widget.listCalculs.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              extentRatio: 0.2,
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 1,
                  padding: EdgeInsets.all(0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  backgroundColor: buttonColor.withOpacity(0.5),
                  foregroundColor: buttonColor,
                  icon: Icons.delete,
                  onPressed: (BuildContext context) {
                    setState(() {
                      widget.listCalculs.removeAt(index);
                    });
                  },
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor(widget.light),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor(widget.light).withOpacity(0.2),
                    offset: -Offset(5, 5),
                    blurRadius: 10.0,
                  ),
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(5, 5),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Row(
                      children: [
                        Text(
                          "${widget.listCalculs[index]} = ",
                          style: TextStyle(color: textColor(widget.light)),
                        ),
                        Text(
                          calculate(
                            widget.listCalculs[index],
                          ),
                          style: TextStyle(
                            color: buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String calculate(String textCalcul) {
    String finaluserinput = textCalcul;
    String preAnswer;
    List<String> listException = ["NaN", "Infinity"];
    finaluserinput = textCalcul.replaceAll('×', '*');
    finaluserinput = finaluserinput.replaceAll('÷', '/');
    finaluserinput = finaluserinput.replaceAll(',', '.');
    finaluserinput = finaluserinput.replaceAll('%', '*(1/100)');
    Parser p = Parser();
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
    preAnswer = preAnswer.replaceAll('.', ',');
    for (var i in listException) {
      if (preAnswer == i) {
        preAnswer = "";
        break;
      }
    }
    return preAnswer;
  }
}

class ConvertionHistory extends StatefulWidget {
  ConvertionHistory(
      {Key? key, required this.light, required this.listConvertions})
      : super(key: key);
  final bool light;
  final List<String> listConvertions;

  @override
  State<ConvertionHistory> createState() => _ConvertionHistoryState();
}

class _ConvertionHistoryState extends State<ConvertionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(widget.light),
      appBar: AppBar(
        title: Text(
          "History",
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
      ),

      //BODY
      body: ListView.builder(
        primary: false,
        itemCount: widget.listConvertions.length,
        itemBuilder: (BuildContext context, int index) {
          String str1 = "";
          String str2 = "";
          for (int i = 0; i < widget.listConvertions[index].length; i++) {
            if (i < widget.listConvertions[index].indexOf("-")) {
              str1 += widget.listConvertions[index][i];
            } else if (i > widget.listConvertions[index].indexOf(">")) {
              str2 += widget.listConvertions[index][i];
            }
          }
          return Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              extentRatio: 0.2,
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 1,
                  padding: EdgeInsets.all(0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  backgroundColor: buttonColor.withOpacity(0.5),
                  foregroundColor: buttonColor,
                  icon: Icons.delete,
                  onPressed: (BuildContext context) {
                    setState(() {
                      widget.listConvertions.removeAt(index);
                    });
                  },
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor(widget.light),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor(widget.light).withOpacity(0.2),
                    offset: -Offset(5, 5),
                    blurRadius: 10.0,
                  ),
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(5, 5),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Row(
                      children: [
                        Text(
                          "$str1 -> ",
                          style: TextStyle(color: textColor(widget.light)),
                        ),
                        Text(
                          str2,
                          style: TextStyle(
                            color: buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
