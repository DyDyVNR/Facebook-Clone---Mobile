

import 'package:assignment_1/constants/user_list_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

GlobalKey<_ProfilePageState> profilePageKey = GlobalKey();

class ProfilePage extends StatefulWidget {
  @override
  Key key = profilePageKey;
  ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return SingleChildScrollView(        
        controller: _scrollController,
        child: SizedBox(          
          height: MediaQuery.of(context).size.height *1.7,
          child: Stack(            
            children: [
              Container(),
                _buildCoverPhoto,
                _buildProfilePhoto,
                const Center(heightFactor: 33, child: Text("Vannara Net", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22))),
                Positioned(
                  top: 350, right: 100,
                  child: _buildCameraIcon),
                Positioned(
                  top: 460,                           
                  child:_build3Buttons,                                                                                                      
                ),            
                Positioned.fill( 
                  top: 460,
                child: Column(                
                    children: [
                      _buildInfo,
                      const SizedBox(height: 10,),
                      _buildFriends
                      
                      ]
                      ),
                      )                                                            
            ],
      
          ),
        ),      
    );
  }

  Widget get _buildCoverPhoto {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.grey[700],
      height:  300,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.camera, color: Colors.white,),
          Text ('  Add Cover Photo', style: TextStyle(color: Colors.white),)
        ],
      ),
    )
    ;
  }

  Widget get _buildProfilePhoto {
    return Center(
      heightFactor: 3,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              spreadRadius: 5
              
            )
          ],
          color: Colors.white,
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(userList[0].image)
          ),
        ),
      ),
     ) );
  }

  Widget get _buildCameraIcon {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white.withOpacity(0.2)
      ),
      child: const Icon(
        CupertinoIcons.camera_fill
      ),
    );
  }

  Widget get _build3Buttons {
    return 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,      
        children: [
          const SizedBox(width: 10,),
          SizedBox(
            width: 145, height: 35,
            child: TextButton.icon(onPressed: (){}, icon: const Icon(Icons.add_circle, color: Colors.white,), label: const Text("Add to story", style: TextStyle(color: Colors.white),), 
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)
            ),),
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: 145, height: 35,
            child: TextButton.icon(onPressed: (){}, icon: const Icon(Icons.edit, color: Colors.white,), label: const Text("Edit profile", style: TextStyle(color: Colors.white)), 
            style: ButtonStyle(                        
              backgroundColor: MaterialStateProperty.all(Colors.grey),        
            ),),
          ) ,
          const SizedBox(width: 10,),
          ElevatedButton(onPressed: (){},  style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey)
            ), 
            child: const Icon(Icons.more_horiz)),
          const SizedBox(width: 10,),   
        ],
      )
    ;
  }

  Widget get _buildInfo {
    return  Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      child: ListView(      
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.houseUser,      
              ),
              title: Text("Lives in Phnom Penh"),
            ),
             const ListTile(
              leading: Icon(
                CupertinoIcons.location_solid,      
              ),
              title: Text("From Phnom Penh"),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.clock,      
              ),
              title: Text("Joined June 2016"),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.calendarCheck,      
              ),
              title: Text("Followed by 666,666 poeple"),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.instagram,      
              ),
              title: Text("dydyvnr"),
            ),
            const ListTile(
              leading: Icon(
                Icons.more_horiz,      
              ),
              title: Text("See your About Info"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextButton(onPressed: (){}, 
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.7))), child: Text("Edit public details", style: TextStyle(color: Colors.blue[100]) ,),),
            )
          ],      
      ),
    );
  }
  
  Widget get _buildFriends {
    return Expanded(
        
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,            
            children: [
              const Row(
                children: [
                  Text("Friends", style: TextStyle(fontWeight: FontWeight.bold),), Spacer(), Text("Find Friends", style:  TextStyle(color: Colors.blue),)
                ],          
              ),
              const Text("666 friends"),
              Container(             
                 constraints: const BoxConstraints(maxHeight: double.infinity),
                  child: GridView.builder(padding: const EdgeInsets.only(top: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                      ), 
                    itemBuilder: (context, index) => 
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(                                                                                                          
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),                          
                                    image: DecorationImage(fit: BoxFit.cover,
                                      image: NetworkImage(userList[index].image),
                                    )
                                  ), 
                                  child: SizedBox(
                                      height: 110, width: MediaQuery.of(context).size.width,
                                  ), ), 
                                Text(userList[index].name),                                                                                                                                                                                                        
                              ]
                            ),
                          ),                                                                         
                      
                    
                  ),  
                  const SizedBox(height: 10,)  ,
                SizedBox(
                  width: 1000,
                  child: TextButton(onPressed: (){}, 
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[700])), child: const Text("See all Friends", style: TextStyle(color: Colors.white) ,),),
                )                                            
            ],
          ),
        ),
        
      
    );
  }

  void goToTop() {
    _scrollController.animateTo(
      0, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut);
      
  }
  
  
}