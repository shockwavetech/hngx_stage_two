import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          title:  const Text('View Mode', style: TextStyle(fontWeight: FontWeight.bold,),),
          backgroundColor: Constants.alternateColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
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
                image: const DecorationImage(
                  image:  AssetImage('images/display.png')
                )

              ),
            ),
            const SizedBox(height: 20,),
            Text(DataProvider.userData['name'], style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 24),),
            Text(DataProvider.userData['role'], style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 20,),
            Container(
                height: 50,
                color: Constants.alternateColor,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('USER INFO'),
                  ],
                )
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Column(
                      children: [
                        Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: Constants.alternateColor,
                            child: const Row(
                              children: [
                                Text('Basic Info'),
                              ],
                            )
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Column(
                      mainAxisAlignment: MediaQuery.of(context).size.height > 800 ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: Constants.alternateColor,
                            child: const Row(
                              children: [
                                Text('Personal Bio'),
                              ],
                            )
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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