//import 'dart:js_interop';
import 'package:doctor_on_demand/cubits/login_cubit.dart';
import 'package:doctor_on_demand/cubits/login_states.dart';
import 'package:doctor_on_demand/screens/home_screen.dart';
import 'package:doctor_on_demand/screens/mesg_screen.dart';
import 'package:doctor_on_demand/screens/signup_screen.dart';
import 'package:doctor_on_demand/shared/cash_helper.dart';
import 'package:doctor_on_demand/shared/comp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
//ignore: must_be_immutable
class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) async {
  if (state is LoginErrorState) {
  print('login Errorrrr ${state.error.message}');
  showToast(text: state.error.message, state: ToastStates.ERROR);
   }
  if (state is AdminLoginSuccessState) {
  await CashHelper.saveData(
  key: 'uIdAdmin',
  value: state.uIdAdmin,
  ).then((value) {
  print('Admin Login Successfully');
  showToast(
  text: 'Admin Logged In Successfully',
  state: ToastStates.SUCCESS
  );
  // uId = state.uIdAdmin;
  }).whenComplete(() =>  navigateAndFinish(context: context, widget:HomeScreen()));
  }
  if (state is LoginSuccessState) {
  await CashHelper.saveData(
  key: 'uId',
  value: state.uId,
  ).then((value) {
  print('Login Successfully');
  showToast(
  text: 'Logged In Successfully', state: ToastStates.SUCCESS);
  // uId = state.uId;
  }).whenComplete(() =>  navigateAndFinish(context: context, widget:MessagesScreen()));
      
  }
  },
   builder: (context, state){
  return Scaffold(
  body: SingleChildScrollView(
  child:Container (
 color:Color.fromARGB(255, 36, 193, 156),
  child: SafeArea(child: Column(
  children: [
  SizedBox(height: 10),
  Padding(padding: EdgeInsets.all(20),
  child: Image.asset("images/doctors.png"),
  ),
  SizedBox(height:0.5),
  Padding(padding: EdgeInsets.all(12),
  child: TextField(
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide( width:3,color: Colors.white)),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide( width:3,color: Colors.white)),
  border: OutlineInputBorder(),
  label: Text("Enter Username or Email",style: TextStyle(color: Colors.white),),
  prefixIcon: Icon(Icons.person ,color: Colors.white,),
  ),
   controller: emailController,),
  ),
  Padding(padding: EdgeInsets.all(12),
  child: TextField(
    
  obscureText: passToggle ?true: false,
  decoration: InputDecoration(
  enabledBorder: OutlineInputBorder(
  borderSide: BorderSide(width:3,color: Colors.white)),
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(width:3,color: Colors.white)),
  border: OutlineInputBorder(),
  label: Text("Enter Your Password",style: TextStyle(color: Colors.white),),
  prefixIcon: Icon(Icons.lock ,color: Colors.white,),
  suffixIcon: InkWell(onTap:(){
  if(passToggle==true){
    passToggle=false;
  }else{
    passToggle=true;
  }
  setState(() {
  });
  },
  child: passToggle ?Icon(CupertinoIcons.eye_slash_fill ,color: Colors.white,):
  Icon(CupertinoIcons.eye_fill ,color: Colors.white,),
  )
  ),
  controller: passwordController,),
  ),
  SizedBox(height: 1),
  Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: Material(
      color: Color.fromARGB(255, 15, 99, 82),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
      onTap: ()async {
      // Navigator.push(
      // context,
      // MaterialPageRoute(
      // builder: (context) => LoginScreen(),
      // ));
       await CashHelper.removeData(key: 'uId');
      if (formKey.currentState!.validate()) {
      LoginCubit.get(context).userLogin(
      email: emailController.text,
        password: passwordController.text,
         );
        }
      },
      child: Center(
        child: Padding(
        padding:
        EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        child:Text("Log in",
        style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
        ),
        
        ),
        
      ) ),
      ),
    ),
  ),
  SizedBox(height: 2),
  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("Don't have an account ?",
    style: TextStyle(color: const Color.fromARGB(255, 20, 17, 17) ,fontSize: 20,)),
    TextButton(onPressed: (){
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => SignUpScreen(),
      ));
    }, child: Text(" create an account ", 
    style: TextStyle(color: Colors.white ,fontSize: 18), )),
  ],
  ),


  ],
  )),
  ),
  )
  );
  
   }
  ),
  
    ); 
    
  }
  
  
}


  
