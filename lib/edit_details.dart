import 'package:flutter/material.dart';
import 'package:hngx_stage_two/main.dart';
import 'package:hngx_stage_two/provider.dart';
import 'constants.dart';

class EditDetails extends StatefulWidget {
  const EditDetails({Key? key}) : super(key: key);

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  String loadingText = 'Save Changes';
  bool loading = false;
  TextEditingController nameController = TextEditingController(text: DataProvider.userData['name']);
  TextEditingController roleController = TextEditingController(text: DataProvider.userData['role']);
  TextEditingController phoneController = TextEditingController(text: DataProvider.userData['phone']);
  TextEditingController emailController = TextEditingController(text: DataProvider.userData['email']);
  TextEditingController slackController = TextEditingController(text: DataProvider.userData['slack']);
  TextEditingController githubController = TextEditingController(text: DataProvider.userData['github']);
  TextEditingController bioController = TextEditingController(text: DataProvider.userData['bio']);





  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    roleController.dispose();
    phoneController.dispose();
    emailController.dispose();
    slackController.dispose();
    githubController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        setState(() {
          DataProvider.currentIndex = 0;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
        return false;
      },
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,),
            onPressed: (){
              setState(() {
                DataProvider.currentIndex = 0;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
            },
          ),
          title:  const Text('Edit Mode', style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Constants.alternateColor,
          actions: [
            TextButton(
                onPressed: ()async{
                  if(!loading){
                   _updateUserData();
                  }

                },
                child: Text(loadingText, style: const TextStyle(color: Colors.green),))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Stack(
                children: [
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
                ],
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomTextField(
                        controller: nameController,
                        hintText: 'Enter your name',
                        label: 'Name',
                        onChanged: (value){},
                    ),
                    CustomTextField(
                      controller: roleController,
                      hintText: 'What\'s your role?',
                      label: 'Role',
                      onChanged: (value){},
                    ),
                    CustomTextField(
                      inputType: TextInputType.phone,
                      controller: phoneController,
                      hintText: 'Enter your phone number',
                      label: 'Phone',
                      onChanged: (value){},
                    ),
                    CustomTextField(
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: 'Enter your email address',
                      label: 'Email',
                      onChanged: (value){},
                    ),
                    CustomTextField(
                      controller: slackController,
                      hintText: 'Enter your slack username',
                      label: 'Slack Username',
                      onChanged: (value){},
                    ),
                    CustomTextField(
                      controller: githubController,
                      hintText: 'Enter your github username',
                      label: 'Github Username',
                      onChanged: (value){},
                    ),
                    CustomTextField(
                      controller: bioController,
                      hintText: 'Write a brief bio about you',
                      label: 'About You',
                      onChanged: (value){},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
  void _updateUserData() {
    if (nameController.text.isEmpty) {
      _showErrorSnackBar('Name cannot be empty');
    } else if (roleController.text.isEmpty) {
      _showErrorSnackBar('Role cannot be empty');
    } else if (phoneController.text.isEmpty) {
      _showErrorSnackBar('Please enter a valid phone number');
    } else if (emailController.text.isEmpty) {
      _showErrorSnackBar('Please enter a valid email');
    } else if (slackController.text.isEmpty) {
      _showErrorSnackBar('Please enter your Slack username');
    } else if (githubController.text.isEmpty) {
      _showErrorSnackBar('Please enter your GitHub username');
    } else if (bioController.text.isEmpty) {
      _showErrorSnackBar('Please enter a brief bio about yourself');
    } else {
      setState(() {
        loading = true;
        loadingText = 'Updating details, please wait...';
      });

      DataProvider.userData = {
        'name': nameController.text,
        'role': roleController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'slack': slackController.text,
        'github': githubController.text,
        'bio': bioController.text
      };

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          DataProvider.currentIndex = 0;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      });
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

}
