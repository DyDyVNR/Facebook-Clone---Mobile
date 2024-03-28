import 'package:assignment_1/Models/user_model.dart';
import 'package:assignment_1/Pages/newsfeed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostPreviewPage extends StatefulWidget {
  final UserModel userModel;
  const PostPreviewPage(this.userModel, { Key? key }) : super(key: key);

  @override
  _PostPreviewPageState createState() => _PostPreviewPageState();
}

class _PostPreviewPageState extends State<PostPreviewPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody
    );
  }

  Widget get _buildBody {
    return  Stack(
      
      children: [
        InkWell(       
          splashFactory: NoSplash.splashFactory, 
          highlightColor: Colors.transparent,
          onTapCancel: () => {Navigator.of(context).pop(NewsfeedPage())},
          onTap: () =>setState(() {
            isClicked = !isClicked;
          }),
          child:  Container(
            height: MediaQuery.of(context).size.height ,
            alignment: Alignment.center,        
            child: Image(image: NetworkImage(
              widget.userModel.photo,            
            ),)      
          ),
        ),
        Visibility(
          visible: !isClicked? true: false,
          child: Positioned(
            right: 10,top: 35,
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert), color: Colors.white, iconSize: 30,),),
        ),
        Visibility(
          visible: !isClicked? true: false,
          child: Positioned(
            bottom: 3, right: 0, left: 0,
            child: Column(
              children: [
                _buildNameCaptiopOnlineTime(widget.userModel),              
                _buildNumOfLikeComment,
                const SizedBox(height: 20,),
                const Divider(color: Colors.white70, height: 1,),
                _buildLikeShare,
              ],
            ),
          ),
        )
      ] 
    );
  }

   Widget get _buildNumOfLikeComment {
    return Row(
      
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(right: 5, left: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:BorderRadius.circular(100)
          ),
          child:
        const Icon(Icons.thumb_up_off_alt_rounded, color: Colors.white, size : 15,)
        ),
        const Text("6666", style: TextStyle(color: Colors.white70)),
        const Spacer(flex: 1,),
        const Text("666 Comments", style: TextStyle(color: Colors.white70))
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
            label: const Text("Like", style: TextStyle(color: Colors.white70),),
            icon:  const Icon(FontAwesomeIcons.thumbsUp, color: Colors.white70,)),
            
          ],
        ),
        Row(
          children: [
            TextButton.icon(onPressed: (){}, 
            icon: const Icon(FontAwesomeIcons.comment, color: Colors.white70,),
            label: const Text("Comment", style: TextStyle(color: Colors.white70)),),
         
          ],
        ),
        Row(
          children: [
            TextButton.icon(onPressed: (){}, 
            icon: const Icon(CupertinoIcons.arrowshape_turn_up_right, color: Colors.white70),
            label: const Text("Share", style: TextStyle(color: Colors.white70)),)
          ],
        )
      ],
    );
  }

  String _gettime(String onlineTime) {
    String toReturn ="";
    if (onlineTime.length<=4)  {
      if (onlineTime.contains('d',) ) {toReturn= "${onlineTime.replaceAll('d', ' days')} AGO";} 
      else if (onlineTime.contains("mn",)) {toReturn= "${onlineTime.replaceAll('mn', ' minutes')} AGO";} 
      else if (onlineTime.contains('m',) ) {toReturn= "${onlineTime.replaceAll('m', ' months')} AGO";} 
      else if (onlineTime.contains('y',)) {toReturn= "${onlineTime.replaceAll('y', ' years')} AGO";} 
      else if (onlineTime.contains('h',)) {toReturn= "${onlineTime.replaceAll('h', ' hours')} AGO";}                
    } else {toReturn = onlineTime;}          
    return toReturn ;
  }

  Widget _buildNameCaptiopOnlineTime (UserModel userModel) {
    String onlineTime = userModel.onlineTime;
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Container(
                    padding: const EdgeInsets.only(left: 5), 
                    margin: const EdgeInsets.only(left: 5),
                    child: Column (                   
                     crossAxisAlignment: CrossAxisAlignment.start,
                       children: [    
                            Row( children: [                            
                              Text(
                                userModel.name,                          
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,),                                                          
                            )]),   
                             Container (                            
                              child: Text(userModel.caption, style: const TextStyle(color: Colors.white70),)),                                          
                             Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                               child: Text(
                                  _gettime(onlineTime),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,),
                                 
                               ),
                             ),                          
                           ],
                         )
                       ]
                     
        
                  )
                  ),
    );
  }
}