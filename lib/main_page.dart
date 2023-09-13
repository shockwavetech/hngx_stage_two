import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hngx_stage_two/provider.dart';

import 'constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.logout,),
            onPressed: (){
              SystemNavigator.pop();
            },
          ),
          title:  Text('View Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),),
          backgroundColor: Constants.alternateColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10
                  )
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: !DataProvider.imageUpdated
                      ? const AssetImage('images/display.png')
                      : DataProvider.imageFile != null
                      ? FileImage(DataProvider.imageFile!)
                      : const AssetImage('images/display.png') as ImageProvider<Object>,
                )

              ),
            ),
            SizedBox(height: 20.h,),
            Text(DataProvider.userData['name'], style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.sp),),
            Text(DataProvider.userData['role'], style: TextStyle(fontSize: 16.sp),),
            SizedBox(height: 20.h,),
            Container(
                height: 50.h,
                color: Constants.alternateColor,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('USER INFO'),
                  ],
                )
            ),
            SizedBox(height: 20.h,),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w,),
                    child: Column(
                      children: [
                        Container(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            color: Constants.alternateColor,
                            child: const Row(
                              children: [
                                Text('Basic Info'),
                              ],
                            )
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          color: Colors.blueGrey,
                          child: Column(
                            children: [
                              InfoHolder(
                                label: 'Name',
                                info: DataProvider.userData['name'],
                                icon: Icons.person,
                              ),
                              InfoHolder(
                                label: 'Role',
                                info: DataProvider.userData['role'],
                                icon: Icons.verified,
                              ),
                              InfoHolder(
                                label: 'Phone',
                                info: DataProvider.userData['phone'],
                                icon: Icons.phone,
                              ),
                              InfoHolder(
                                label: 'Email',
                                info: DataProvider.userData['email'],
                                icon: Icons.email,
                              ),
                              InfoHolder(
                                label: 'Slack Username',
                                info: '@${DataProvider.userData['slack']}',
                                icon: Icons.alternate_email,
                              ),
                              InfoHolder(
                                label: 'Github Handle',
                                info: '@${DataProvider.userData['github']}',
                                icon: Icons.alternate_email,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w,),
                    child: Column(
                      mainAxisAlignment: MediaQuery.of(context).size.height > 800 ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            color: Constants.alternateColor,
                            child: const Row(
                              children: [
                                Text('Personal Bio'),
                              ],
                            )
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                            color: Colors.blueGrey,
                            child: Text(DataProvider.userData['bio'], style: const TextStyle( wordSpacing: 2,), textAlign: TextAlign.justify,)
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoHolder extends StatelessWidget {
  const InfoHolder({
    super.key,
    required this.label,
    required this.info,
    required this.icon
  });

  final String label;
  final String info;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      subtitle: Text(info, style: const TextStyle(color: Colors.white),),
      leading: Icon(icon, color: Colors.green,),
    );
  }
}