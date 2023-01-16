import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Layouts/Home-Layout.dart';

class Done extends StatelessWidget {
  final String amount;
  Done(
  {
    required this.amount
}
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(
              left: 20
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: SvgPicture.asset('lib/images/211650_close_circled_icon.svg', width: 30,color: Colors.grey.withOpacity(0.4),)),
          ),
          SizedBox(height: 30,),
          Center(
            child: Text(
              'Funds have been sent!',
              style: TextStyle(
                fontSize: 14,
                color:Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
              "Due to security risk with the receiver's account we are temporarily holding the funds.",
              style: TextStyle(
                fontSize: 14,
                color:Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
            'To release the funds to the receiver:',
              style: TextStyle(
                fontSize: 14,
                color:Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
            '1. Notify the reciever about the hold on funds.',
              style: TextStyle(
                fontSize: 14,
                color:Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
              "2. To send more than \$999, the reciever must send you a minimum of \$50 in total funds.",
              style: TextStyle(
                fontSize: 14,
                color:Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
              "3. The funds will be released instantly upon meeting the minimum transaction requirement from the receiver of \$50.",
              style: TextStyle(
                fontSize: 14,
                color:Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
