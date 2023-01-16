import 'package:cashapp/Modules/payment-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


import '../Models/Model.dart';
import '../cutom-page-route.dart';



class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late List<List<dynamic>> keys;
  late Map<String,Widget> numbers;
  late String amount;
  late String value;
  late Text x;
  final oCcy = new NumberFormat("#,##0.00", "en_US");
String dis='';

  @override
  void initState() {
    super.initState();
    keys = [
      ['1','2','3'],
      ['4','5','6'],
      ['7','8','9'],
      [
       '.',
       '0',
        Container(
            width: 100,height: 40 ,
            decoration: BoxDecoration(
                color:Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: const Center(
                child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            ))),
      ],
    ];
    value='';
    amount = '';
  }

  onKeyTap(val) {
    if (val == '0' && amount.isEmpty) {
      return;
    }
    setState(() {
      amount = amount + val;
    });
  }

  onBackspacePress() {
    if (amount.isEmpty) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  renderKeyboard() {
    return keys
        .map(
          (x) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [

                Container(
                  color: Colors.amber.withOpacity(0),
                  child: Row(
        children: x.map(
                      (y) {
                    return Expanded(
                      child: Container(
                        color: Colors.amber.withOpacity(0),
                        child: KeyboardKey(
                          label: y,
                          value: y,
                          onTap: (val) {
                            if (val is Widget) {
                              onBackspacePress();
                            } else {
                              onKeyTap(val);
                            }
                          },
                        ),
                      ),
                    );
                  },
        ).toList(),
      ),
                ),


              ],
            ),
          ),
    )
        .toList();
  }

  renderAmount() {
    String display = '\$0';
    TextStyle style = const TextStyle(
      fontSize: 100.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );

    if (amount.isNotEmpty) {
      // NumberFormat f = NumberFormat('#,###');
      display = '\$'+oCcy.format(int.tryParse(amount));
      // display = f.format(int.parse(amount));
      style = style.copyWith(
        color: Colors.white,
      );
    }
    setState(() {
      dis=display;
    });
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: Text(
            display,
            style: style,
          ),
        ),
      ),
    );
  }

  renderConfirmButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
      child: GestureDetector(
        onTap: amount.isNotEmpty ? () {} : null,
        child: Container(
          height: 50.0,
          width: 150,
          decoration: BoxDecoration(
            color: amount.isNotEmpty ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.22),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              'Request',
              style: TextStyle(
                fontSize: 16,
                color: amount.isNotEmpty ? Colors.white : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  renderConfirmButton2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CustomPageRoute(child: pay(amount: dis),direction: AxisDirection.up,duration: Duration(milliseconds: 200)),
          );
          },
        child: Container(
          height: 50.0,
          width: 150,
          decoration: BoxDecoration(
            color: amount.isNotEmpty ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.22),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              'Pay',
              style: TextStyle(
                fontSize: 16,
                color: amount.isNotEmpty ? Colors.white : Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
  renderConfirmButton3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: GestureDetector(
        onTap: amount.isNotEmpty ? () {} : null,
        child: Container(
          alignment: Alignment.center,
          height: 40.0,
          width: 85,
          decoration: BoxDecoration(
            color: amount.isNotEmpty ?Colors.white.withOpacity(0.22) : Colors.white.withOpacity(0.22),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'USD',
                    style: TextStyle(
                      fontSize: 14,
                      color: amount.isNotEmpty ? Colors.white : Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00D632),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            color: const Color(0xff00D632),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Row(
                    children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('lib/images/qr-scanner_2.svg',width: 40,color: Colors.white,),
                        SvgPicture.asset('lib/images/qr-scanner_2.svg',width: 38,color: Colors.white,),
                        SvgPicture.asset('lib/images/qr-scanner_2.svg',width: 36,color: Colors.white,),
                      ],
                    ),

                    const Spacer(),

                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Icon(Icons.account_circle_outlined ,size: 50,color: Colors.white),
                         Stack(
                           alignment: Alignment.center,
                           children: [
                             Container(
                               width: 22,
                               height: 22,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(Radius.circular(30))
                               )
                               ,
                             ),
                             Container(
                               width: 15,
                               height: 15,
                               decoration: BoxDecoration(
                                 color: Colors.red,
                                 borderRadius: BorderRadius.all(Radius.circular(30)),
                               ),
                               child: Center(
                                 child: Text(
                                   '2',style: TextStyle(color: Colors.white,fontSize: 10),
                                 ),
                               )
                               ,
                             ),
                           ],
                         )
                      ],
                    ),

                    ],
                  ),
                ),
                const SizedBox(height: 80,),
                renderAmount(),
                const SizedBox(height: 50,),
                renderConfirmButton3(),
                const SizedBox(
                  height: 5,
                ),
                ...renderKeyboard(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  renderConfirmButton(),
                  const SizedBox(width: 10,),
                  renderConfirmButton2(),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}