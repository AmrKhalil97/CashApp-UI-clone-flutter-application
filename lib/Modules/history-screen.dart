import 'package:cashapp/Modules/message-screen.dart';
import 'package:cashapp/Modules/transaction-screen.dart';
import 'package:flutter/material.dart';

import '../cutom-page-route.dart';
import '../shared.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children:  [
                Text('Activity',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.grey.withOpacity(0.9)),),
                  const Spacer(),
                  const Icon(Icons.search,size: 30,color: Colors.grey,),
                  const SizedBox(width: 15,),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Icon(Icons.account_circle_outlined ,size: 30,color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return
                        Column(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage:
                            AssetImage(
                                'lib/images/${index}.jpg'
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(height: 5,),
                          Text((getFirstWords(names[index],1,)) ?? '' ,style: const TextStyle(fontSize: 12),)
                        ],
                      );
                    },
                    separatorBuilder:(context, index) {

                      return const SizedBox(width: 15,);
                      },
                    scrollDirection: Axis.horizontal,
                    itemCount:names.length),
              ),
            ),
            Container(
                height: 20,
                color: const Color(0xffD3D3D3).withOpacity(0.1),
                width: double.infinity,
                ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: SizedBox(
                height: 1000,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      money.shuffle();
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(child: HistoryMsg(amount: suggested_money[index], url:avatars[index] ,userName:suggested_username[index] ),direction: AxisDirection.left,duration: const Duration(milliseconds: 50)),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color(0xff00008B),
                                  // image: DecorationImage(
                                  //   image: NetworkImage('${widget.url}',
                                  //   ),fit: BoxFit.cover
                                  // ),
                                  borderRadius:BorderRadius.all(Radius.circular(15))
                              ),
                              child: Center(child: Text(suggested_username[index][0],style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
                            ),
                            const SizedBox(width: 15,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(suggested_username[index],style: const TextStyle(fontWeight: FontWeight.bold,),),
                                const SizedBox(height: 10,),
                                Text('Successful',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.5)),),
                              ],
                            ),
                            const Spacer(),
                            Text(suggested_money[index],style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.8)),),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>  Container(
                      height: 15,
                      color: const Color(0xffD3D3D3).withOpacity(0.1),
                      width: double.infinity,
                    ),
                    itemCount: suggested_username.length),
              ),
            )
          ],
        ),
      ),
    );
  }
  String getFirstWords(String sentence, int wordCounts) {
    return sentence.split(" ").sublist(0, wordCounts).join(" ");
  }
}
