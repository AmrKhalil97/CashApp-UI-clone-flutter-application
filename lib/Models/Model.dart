import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const KeyboardKey({Key? key,
    required this.label,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {

  renderLabel(){
    if(widget.label is Widget){
      return widget.label;
    }

    return
      Container(
          width: 100,height: 40 ,
          decoration: BoxDecoration(
              color:Colors.white.withOpacity(0.12),
              borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: Center(child:  Text(
            widget.label,
            style:const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          )));

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Center(
          child: renderLabel(),
        ),
      ),
    );
  }
}