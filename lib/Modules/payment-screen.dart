import 'package:cashapp/Layouts/Home-Layout.dart';
import 'package:flutter/material.dart';

import '../cutom-page-route.dart';
import '../shared.dart';
import 'message-screen.dart';

class pay extends StatefulWidget {
  final String amount;
  pay({required this.amount});

  @override
  State<pay> createState() => _payState();
}

class _payState extends State<pay> {

TextEditingController username_controller=TextEditingController();
var un;
var mny;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: const Icon(Icons.close_outlined,size: 30,)),
                  const SizedBox(width: 80,),
                  Column(
                    children: [
                      Text(''+(widget.amount == '' ? '0':widget.amount),style: const TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        children:  [
                          Text('Cash Balance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey.withOpacity(0.9))),
                          Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey.withOpacity(0.9),size:21,),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(child: Done(
                            amount: widget.amount,

                        ),direction: AxisDirection.left,duration: const Duration(milliseconds: 50)),
                      );
                      setState((){
                        suggested_username.add(username_controller.text);
                        suggested_money.add(widget.amount);
                      });
                        print('xxxxxxxxxxxxx');
                        print(suggested_username);
                    },
                    child: Container(
                      width: 60,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Color(0xff00D632),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Center(
                        child: Text(
                          'Pay',style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children:  [
                  Column(
                    children: const [
                      SizedBox(height: 8,),
                      Text('To'),
                    ],
                  ),
                  const SizedBox(width: 10,),
                   SizedBox(
                    width: 250,
                    height: 40,
                    child: TextField(
                      controller: username_controller,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
color: Colors.lightGreenAccent
                      ),
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.lightGreenAccent

                          ),

                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        hintText: 'Name. \$Cashtag. Phone. Email',
                        hintStyle: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,

                        )
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children:  [
                  Column(
                    children: const [
                      SizedBox(height: 8,),
                      Text('For'),
                    ],
                  ),
                  const SizedBox(width: 10,),
                  const SizedBox(
                    width: 250,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Add a note',
                          hintStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.withOpacity(0.2),
            ),

            Container(
              height: 35,
                color: const Color(0xffD3D3D3).withOpacity(0.1),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10),
                  child: Text('SUGGESTED',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey.withOpacity(0.9)),),
                )),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: SizedBox(
                height: 450,
                child: ListView.separated(
                    itemBuilder: (context, index) {

                     return Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage(
                                  'lib/images/${index}.jpg'
                                ),
                            // NetworkImage(
                            // avatars[index]
                            // ),
                            backgroundColor: Colors.transparent,
                          ),
                           const SizedBox(width: 10,),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(names[index],style: const TextStyle(fontWeight: FontWeight.bold,),),
                               Text(userNames[index],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.5)),),
                             ],
                           )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 20,),
                    itemCount: 6),
              ),
            )

          ],
        ),
      )
      ,
    );
  }
}
