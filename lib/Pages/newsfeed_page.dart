// ignore_for_file: prefer_const_constructors

import 'package:assignment_1/Models/user_model.dart';
import 'package:assignment_1/Pages/main_page.dart';
import 'package:assignment_1/Pages/post_preview_page.dart';
import 'package:assignment_1/constants/user_list_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


GlobalKey<_NewsfeedPageState> NewsfeedPageKey = GlobalKey();
class NewsfeedPage extends StatefulWidget {
  @override
  final Key key = NewsfeedPageKey;

  NewsfeedPage({Key? key}) : super(key: key); 

  
  @override
  _NewsfeedPageState createState() => _NewsfeedPageState();
  
}

class _NewsfeedPageState extends State<NewsfeedPage> with AutomaticKeepAliveClientMixin{

  ScrollController _scrollController = ScrollController();
  bool _showAppbar = true; 
  bool isScrollingDown = false;

  @override
void initState() {
  super.initState();
  _scrollController = ScrollController();
  _scrollController.addListener(() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        _showAppbar = false;
        setState(() {
          
        });
      }
    }

    if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        _showAppbar = true;
       setState(() {
         
       });
      }
    }
  });
}

  @override
void dispose() {
  _scrollController.dispose();
  _scrollController.removeListener(() {});
  super.dispose();
}

   @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(      
     backgroundColor:  Colors.black,
      body: _buildBody ,
          
    );    
  }
  
   

   SafeArea get _buildBody {
    return SafeArea(    
      child: Column(
        children: [
          AnimatedContainer(
          height: _showAppbar? 48: 0 ,
          duration: Duration(milliseconds: 180),          
          child: AppBar(            
                backgroundColor: Colors.black,
                title: Text("facebook", style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold, fontFamily: "Questrial" ),),
                actions:  [
                  IconButton( onPressed: () {  }, icon:Icon(CupertinoIcons.search),), 
                  SizedBox(width: 10, ),
                  IconButton( onPressed: () {  },icon: Icon(FontAwesomeIcons.facebookMessenger) )
                ]
                ),
                
        ),
        Expanded(child: SingleChildScrollView(controller: _scrollController, child: Column(
          children: [
            _buildPost,
            SizedBox(height: 10,),
            _buildStory,
            _buildNewsfeed,
          ],
        ),))]
      ),
    );
  }

  // Widget get _buildBody {
  //   return Container(
  //     child: _buildMainList,
  //   );
  // }

  //  Widget get _buildMainList {
  //   return ListView(
  //    // controller: _scrollController,
  //   shrinkWrap: true,
  //     children: [
  //       _buildPost,
  //       SizedBox(height: 10,),
  //       _buildStory,
  //       _buildNewsfeed
  //     ],
  //   );
  // }
  

   void goToTop() {
    _scrollController.animateTo(
      0, 
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceInOut);
      isScrollingDown = false;
      _showAppbar = true;
  }

  Widget get _buildPost {
    return Container(
      color: Colors.grey[900],
      height: 130,
      child: Column(
        children: [
          Row(    
            children: [
              InkWell(
                onTap: () => setState(() {                                       
                  pageController.animateToPage(3, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  currentIndex=3;
                }
                ),
                
                child: Container(
                  margin: EdgeInsets.only(top: 5, left: 5), 
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:  DecorationImage(
                    image: NetworkImage(userList[0].image), fit:BoxFit.fill )
                          ),
                        
                      ),
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 335,
                margin: EdgeInsets.only(left: 5, top: 20, bottom: 20, right: 5),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(                    
                    hintText: "What's on your mind?",
                    hintStyle: TextStyle(color: Colors.white70, ),
                    border: InputBorder.none,
                    ),
                  ),
                ),           
            ],
          ),
          Divider(height: 2, color: Colors.white38,),         
          IntrinsicHeight(            
            child: Row(              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.videocam_fill), color: Colors.red,),
                    Text("Live", style: TextStyle(color: Colors.white54),),
                  ],
                ),
                VerticalDivider(color: Colors.white54, indent: 12, endIndent: 12,),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.photo_fill_on_rectangle_fill), color: Colors.green,),
                    Text("Photo", style: TextStyle(color: Colors.white54),),
                  ],
                ),
                VerticalDivider(color: Colors.white54, indent: 12, endIndent: 12 ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.video_call_rounded), color: Colors.purple,),
                    Text("Room", style: TextStyle(color: Colors.white54),),
                  ],
                ),                
              ],
            ),            
          ),      
        ],
      ),
    );
  }

  Widget get _buildStory {
    return Container(     
      height: 220,    
      color: Colors.grey[900], 
      child:  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length ,                
        itemBuilder: (context, index){
          return index==0? Container(     
            width: 110,                       
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[800],
            ), 
            margin: EdgeInsets.fromLTRB(5, 10, 5, 10), 
            child: Stack(
              children: [
                Container(
              height: 146,  
              decoration: BoxDecoration(             
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              
              image: DecorationImage(                                
                fit: BoxFit.cover,
                image: NetworkImage(userList[index].image), 
                alignment: Alignment.topCenter
                )              
            ),
            ),
             Positioned(               
               bottom: 33,
               left: 12,
               child: FittedBox(                                 
                alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(                    
                    shape: CircleBorder(                     
                      side: BorderSide(
                        color: Colors.grey.shade800,
                        width: 3
                      )
                    ),   
                    elevation: 0,        
                    onPressed: () => {}, 
                    fillColor: Colors.blue,
                    splashColor: Colors.transparent,
                    child: Icon(Icons.add, color: Colors.white, size: 30,),
                    
                    ),
                ),
             ),
             Positioned(
               bottom: 10,
               left: 20,
               child: Text("Create Story", style: TextStyle(color: Colors.white, fontSize: 12),))

              ],
            ) 
                                                        
                        
        
          )
          
          :Container(          
            alignment: Alignment.topLeft,
            width: 110,
            height: 150,
            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
           
            child: Stack(
              children:[
                Container(
                   decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[800],
              image: DecorationImage(image: NetworkImage(userList[index].photo), fit: BoxFit.cover)              
            ),
            ),
                Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.only(top: 5, left: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:BorderRadius.circular(100)
                          ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(                  
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                        image: NetworkImage(userList[index].image), fit:BoxFit.fill )
                              ),
                        )
                      ),
                
                Positioned(
                  bottom: 10,
                  left: 5,
                  child: Text(userList[index].name, style: TextStyle(color: Colors.white),))
              ] 
            ),
     
          );
        })
        
      );
  }

   Widget get _buildNewsfeed {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
        ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: userList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index)
        {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            height: 420,
            decoration: BoxDecoration(
             color: Colors.grey[900],
             ),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                _buildPersonTitle(userList[index]),
                _buildCaption(userList[index]),
                _buildContent(index),
                Padding(padding: EdgeInsets.all(10), child: _buildNumOfLikeShare,),
                Divider(color: Colors.white70, height: 1,),               
                _buildLikeShare
              ],
            )
    );       
        }
      )
    );
  }

  Widget  _buildPersonTitle(UserModel user ){
     return Row( 
              children: [
                  Container (     
                    
                    margin: EdgeInsets.only(top: 5, left: 5,),
                    decoration: BoxDecoration(                     
                      borderRadius:BorderRadius.circular(100),
                               ),
                                 
                      child:Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                          image: NetworkImage(user.image), fit:BoxFit.fill ),
                                 ),        
                               )
                             ),
                 
                Padding(
                  padding: EdgeInsets.only(left: 5), 
                  child: Column (                   
                   crossAxisAlignment: CrossAxisAlignment.start,
                     children: [    
                          Row( children: [                            
                            Text(
                              user.name,                          
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,),                                                          
                          )]),                                             
                           Row(
                         children: [
                           Text(
                              "${user.onlineTime} • ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,),
                             
                           ),
                           Icon(Icons.public, color: Colors.white70, size: 12,)                          
                         ],
                       )
                     ]
                   
      
                )
                ),   
                Spacer(flex: 1,),
                  Row(
                    children: [                
                      IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_rounded, color: Colors.white70,)),
                      IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.xmark, color: Colors.white70, )),
                    ],
                  ),
                  ]  
    );
  }

  Widget _buildCaption(UserModel caption) {
    return Row(
      children: [
        Container (
          padding: EdgeInsets.all(10),
          child: Text(caption.caption, style: TextStyle(color: Colors.white70),))
      ],
    );
  }

  Widget _buildContent ( index) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostPreviewPage(userList[index])))
            
          },
          child: Container(
            height: 220,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(userList[index].photo), fit: BoxFit.fitWidth)
            ),   
          ),
        );
      }
    );
  }

  Widget get _buildNumOfLikeShare {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:BorderRadius.circular(100)
          ),
          child:
        Icon(Icons.thumb_up_off_alt_rounded, color: Colors.white, size : 15,)
        ),
        Text("6666", style: TextStyle(color: Colors.white70)),
        SizedBox(width: 140,),
        Text("666 Comments • 66 shares", style: TextStyle(color: Colors.white70))
        ],
        

    );
  }

  Widget get _buildLikeShare {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,    
      
      children: [
        Row(
          children: [
            TextButton.icon(onPressed: () {  },       
            label: Text("Like", style: TextStyle(color: Colors.white70),),
            icon:  Icon(FontAwesomeIcons.thumbsUp, color: Colors.white70,)),
            
          ],
        ),
        Row(
          children: [
            TextButton.icon(onPressed: (){}, 
            icon: Icon(FontAwesomeIcons.comment, color: Colors.white70,),
            label: Text("Comment", style: TextStyle(color: Colors.white70)),),
         
          ],
        ),
        Row(
          children: [
            TextButton.icon(onPressed: (){}, 
            icon: Icon(CupertinoIcons.arrowshape_turn_up_right, color: Colors.white70),
            label: Text("Share", style: TextStyle(color: Colors.white70)),)
          ],
        )
      ],
    );
  }

 
}
