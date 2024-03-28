import 'package:assignment_1/Pages/newsfeed_page.dart';
import 'package:assignment_1/Pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PageController pageController = PageController();
int currentIndex = 0;

GlobalKey<_MainPageState> mainPageKey = GlobalKey();
class MainPage extends StatefulWidget {
  @override
  Key key = mainPageKey;
  
   MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        
        onPageChanged: (value) => setState(() {
          value==0? currentIndex = value=0 : currentIndex=value+2;
          
        }),
      //  physics: NeverScrollableScrollPhysics(),
        children: [     
          NewsfeedPage(),
         
         ProfilePage()
        ],
      ),
      bottomNavigationBar: _buildBottom,
      
    );
  }

 
    

   Widget get _buildBottom {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white70,
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {     
         if (currentIndex != index) {
           currentIndex = index;
          pageController.animateToPage(index, duration: const Duration(milliseconds: 180), curve: Curves.easeInOut); 
          return;
         }
          else { 
            if (currentIndex==0)
          {NewsfeedPageKey.currentState!.goToTop(); } 
            else if (currentIndex==1)
          { }
           else if (currentIndex==3)
          {profilePageKey.currentState!.goToTop();}    
        }
        }
        );
      
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "", ),
        BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.store_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_circle,), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ""),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bars, size: 20,), label: ""),
      ],
    );
  }

}