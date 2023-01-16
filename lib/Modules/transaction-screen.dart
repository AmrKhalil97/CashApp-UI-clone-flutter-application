
import 'package:flutter/material.dart';
import '../Layouts/Home-Layout.dart';
class HistoryMsg extends StatefulWidget {
 String amount;
final String url;
 String userName;

    HistoryMsg({
     super.key,
  required this.amount,
  required this.url,
  required this.userName,
});

  @override
  State<HistoryMsg> createState() => _HistoryMsgState();
}

class _HistoryMsgState extends State<HistoryMsg> {

  TextEditingController usernameContoller=TextEditingController();
  TextEditingController amoutController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
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
                      child: const Icon(Icons.close_outlined,size: 25,color: Colors.grey,)),
                  const Spacer(),
                  const Icon(Icons.more_horiz,size: 30,color: Colors.grey,)
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: Container(
                width: 75,
                height: 75,
                decoration: const BoxDecoration(
                  color: Color(0xff00008B),
                  // image: DecorationImage(
                  //   image: NetworkImage('${widget.url}',
                  //   ),fit: BoxFit.cover
                  // ),
                    borderRadius:BorderRadius.all(Radius.circular(15))
                ),
                child: Center(child: Text(widget.userName[0],style: const TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.w500),)),
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: Text(
                    widget.userName,
                style: const TextStyle(
                  fontSize: 18,
                  color:Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Text(
                '''The funds have been sent, but will not be available until ${widget.userName} meets the minimum transaction requirement.''',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Text(
                '''You must receive at least \$50 in transactions from ${widget.userName} to instantly release the ${widget.amount} into ${widget.userName}'s account.''',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color:Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Center(
                child: Text(
                  widget.amount,
                  style: TextStyle(
                    fontSize: 50,
                    color:Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: TextField(
                cursorColor: Colors.white.withOpacity(0),
              controller: amoutController,
                obscureText: true,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'PLEASE ENTER YOUR EMAIL',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: TextField(
                cursorColor: Colors.white.withOpacity(0),
                controller: usernameContoller,
                obscureText: true,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'PLEASE ENTER YOUR EMAIL',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0)),
                ),
              ),
            ),
            const SizedBox(height: 130,),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.userName=usernameContoller.text;
                  widget.amount=amoutController.text;

                });
              },
              child: Center(
                child: Container(
                  width: 115,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.04),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const Icon(Icons.done,color: Colors.green,size: 20,),
                        const SizedBox(width: 5,),
                        Text(
                          'Completed',
                          style: TextStyle(color: Colors.green.withOpacity(0.6),fontWeight: FontWeight.w500,fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                width: 115,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  border: Border(
                      bottom: BorderSide( //                   <--- left side
                        color: Colors.grey.withOpacity(0.5),
                        width: 0.5,
                      ),),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Web Receipt',
                        style: TextStyle(color: Colors.grey.withOpacity(0.5),fontWeight: FontWeight.w500,fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
