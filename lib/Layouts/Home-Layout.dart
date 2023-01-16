import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Modules/Home-Screen.dart';
import '../Modules/history-screen.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> screen = [
    const CustomKeyboard(),
    const CustomKeyboard(),
    const CustomKeyboard(),
    const CustomKeyboard(),
    History(),
  ];


  int _selectedScreenIndex = 2;

  @override
  Widget build(BuildContext context) {
    if(_selectedScreenIndex == 4){

    }else {
      setState(() {

      });
    }
    return Scaffold(
      backgroundColor: Color(0xff00D632),
      body:
      screen[_selectedScreenIndex],//      backgroundColor: Color(0xff00D632),
    bottomNavigationBar: SizedBox(
        height: 62,
        child: Wrap(
          children: [
            BottomNavigationBar(
              backgroundColor:_selectedScreenIndex ==2? Color(0xff00D632) : Colors.white,
              elevation: 0,
              currentIndex: _selectedScreenIndex,
              type: BottomNavigationBarType.fixed,
              onTap: _selectScreen,
              selectedItemColor: const Color(0xFF800080),
              items: [
                BottomNavigationBarItem(

      activeIcon:
      SvgPicture.asset('lib/images/New-Project-_4_.svg', width: 35,color: _selectedScreenIndex ==2? Color(0xff00D632) : Colors.white,),
        icon: SvgPicture.asset('lib/images/New-Project-_4_.svg', width: 30,color: _selectedScreenIndex ==2? Colors.white.withOpacity(0.7): Colors.grey,),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon:
                    SvgPicture.asset('lib/images/New-Project-_3_.svg', width: 35,color: _selectedScreenIndex ==2? Colors.white : Colors.grey,),
                    icon: SvgPicture.asset('lib/images/New-Project-_3_.svg', width: 30,color: _selectedScreenIndex ==2? Colors.white.withOpacity(0.7) : Colors.grey,),
                    label: ''),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.attach_money_rounded , size: 35,color: Colors.white.withOpacity(1),),
                  icon: Icon(Icons.attach_money_rounded , size: 30,color: _selectedScreenIndex ==2? Colors.white.withOpacity(0.7) : Colors.grey,),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.search , size: 35,color: Colors.white.withOpacity(1),),
                    icon: Icon(Icons.search , size: 30,color:_selectedScreenIndex ==2? Colors.white.withOpacity(0.7) : Colors.grey,),
                    label: ''),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.access_time_sharp , size: 35,color: _selectedScreenIndex ==2? Colors.white.withOpacity(0.7) : Colors.grey,),
                    icon: Icon(Icons.access_time_sharp , size: 30,color: _selectedScreenIndex ==2? Colors.white.withOpacity(0.7) : Colors.grey,),
                    label: ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
}
