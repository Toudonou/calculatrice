// ignore_for_file:  sort_child_properties_last, prefer_const_literals_to_create_immutables,prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables

import 'package:calculatrice/constants.dart';
import 'package:calculatrice/converter.dart';
import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  Options(
      {Key? key,
      required this.light,
      required this.index,
      required this.listConvertions})
      : super(key: key);
  final bool light;
  int index;
  final List<String> listConvertions;
  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(widget.light),
      appBar: AppBar(
        title: Text(
          "Options",
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
      body: ListView(
        primary: false,
        children: [
          SizedBox(height: 30),
          widgetBuilder("Data Calculation",
              widget.index == 0 ? buttonColor : textColor(widget.light)),
          SizedBox(height: 45),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: InkWell(
              onTap: () {
                Future.delayed(Duration(milliseconds: 175), () {
                  Navigator.of(context).pop();
                });
              },
              splashColor: backgroundColor(!widget.light).withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              child: Ink(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                  child: Text(
                    "Standerd",
                    style: TextStyle(
                      color: widget.index == 1
                          ? buttonColor
                          : textColor(widget.light),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 45),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.index = 2;
                });
                Future.delayed(Duration(milliseconds: 175), () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Converter(
                        light: widget.light,
                        listConvertions: widget.listConvertions,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnmation, child) {
                        var tween = Tween(
                                begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                            .chain(CurveTween(curve: Curves.linear));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                });
              },
              splashColor: backgroundColor(!widget.light).withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              child: Ink(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                  child: Text(
                    "Converter",
                    style: TextStyle(
                      color: widget.index == 2
                          ? buttonColor
                          : textColor(widget.light),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 45),
          widgetBuilder("Scientific",
              widget.index == 3 ? buttonColor : textColor(widget.light)),
          SizedBox(height: 45),
          widgetBuilder("Programmer",
              widget.index == 4 ? buttonColor : textColor(widget.light)),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget widgetBuilder(String _label, Color _labelColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: InkWell(
        onTap: () {},
        splashColor: backgroundColor(!widget.light).withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
            child: Text(
              _label,
              style: TextStyle(
                color: _labelColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
