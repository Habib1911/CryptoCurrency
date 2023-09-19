import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 10 , right: 10),
        child: Column(
          children: [ Column(
                children: [
                  SizedBox(height: 55,),
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://www.pngitem.com/pimgs/m/22-223968_default-profile-picture-circle-hd-png-download.png",),
                    radius: 55,
                  ),
                  SizedBox(height: 10,),
                  Text("Habib",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("habib@gmail.com",style: TextStyle(color: Colors.white),),
                ],
              ),
            SizedBox(height: 50),
            Row(
                children: [
                  SizedBox(
                    width:190,
                    height: 50,
                    child :
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(21, 31, 43, 1), // Background color
                      ),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Text("From Gallery",style: TextStyle(fontSize: 17),),
                            SizedBox(width: 5,),
                            Icon(Icons.image_outlined),
                          ],
                        ),
                      )
                  ),
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                    width:190,
                    height: 50,
                    child :
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(21, 31, 43, 1), // Background color
                        ),
                        onPressed: (){},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Text("Add Photo",style: TextStyle(fontSize: 17),),
                              SizedBox(width: 5,),
                              Icon(Icons.camera_alt),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20,),
            SizedBox(
              width:390,
              height: 50,
              child :
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(21, 31, 43, 1), // Background color
                  ),
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text("Change Theme",style: TextStyle(fontSize: 17),),
                        SizedBox(width: 5,),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  )
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width:390,
              height: 50,
              child :
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(21, 31, 43, 1), // Background color
                  ),
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text("Change Language",style: TextStyle(fontSize: 17),),
                        SizedBox(width: 5,),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  )
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width:390,
              height: 50,
              child :
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(21, 31, 43, 1), // Background color
                  ),
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text("Logout",style: TextStyle(fontSize: 17),),
                        SizedBox(width: 5,),
                        Icon(Icons.logout),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
