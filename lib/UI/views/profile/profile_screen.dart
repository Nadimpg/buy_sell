import 'package:buy_sellapp/Model/user_profile.dart';
import 'package:buy_sellapp/UI/views/profile/update_profile_screen.dart';
import 'package:buy_sellapp/UI/widgets/custom_button.dart';
import 'package:buy_sellapp/UI/widgets/custom_text_field.dart';
import 'package:buy_sellapp/services/firestore_db.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _uidController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Profile',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: FireStoreDB().getUserProfile(),
            builder: (_,snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  UserProfile userProfile=snapshot.data as UserProfile;
                  _nameController.text=userProfile.name;
                  _emailController.text=userProfile.email!;
                  _uidController.text=userProfile.uid!;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Name'),
                        Text(_nameController.text),
                        const SizedBox(height: 16,),
                        const Text('Email'),
                        Text(_emailController.text),
                        const SizedBox(height: 16,),
                     /*   customFormField(TextInputType.text, _nameController, context, 'user name', (val){},prefixIcon: Icons.person_outline),
                        customFormField(TextInputType.text, _emailController, context, 'user mail', (val){},prefixIcon: Icons.email_outlined),
                        customFormField(TextInputType.text, _uidController, context, 'user uid', (val){},prefixIcon: Icons.verified),
                        customButton('Update Profile', ()async{
                          final userData=UserProfile(name: _nameController.text.trim(), email: _emailController.text.trim(), uid: _uidController.text.trim());
                          await FireStoreDB().userProfileUpdate(userData);
                        }),*/
                        customButton('Edit Profile', (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const UpdateProfileScreen()));
                        })
                      ],
                    ),
                  );
                }else{
                  return const Center(child: Text('Something went wrong'));
                }
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
