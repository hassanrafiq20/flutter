import 'package:flutter/material.dart';
import 'package:flutter_ecomerce/pages/register_page.dart';
import 'package:flutter_ecomerce/services/authentication.dart';
import 'package:flutter_ecomerce/services/validate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailCntrl = TextEditingController();
  final passCntrl = TextEditingController();

  String? email="";
  String? pass="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page'),),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/media/backgrounds/phoenix_02.jpg'),
              fit: BoxFit.fill
          )
        ),
        child: SafeArea(
          child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                        children: [
                          TextFormField(
                            controller: emailCntrl,
                            maxLength: 50,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Email',
                              prefixIcon: Icon(Icons.mail)
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onSaved: (value){
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                             controller: passCntrl,
                             maxLength: 8, 
                              decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.mail)
                            ),
                            validator: validatePass,
                            onSaved: (value){
                              setState(() {
                                pass=value;
                              });
                            },
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(onPressed: _loginUser, child: Text('Login')),
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
                            }, child: Text('Register')),
                          ),
                        ],
                        ),
                      ),
                    )
                  ],
                ),
            ),
          )
          ),
      ),
    );
  }

  void _loginUser(){
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
       //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check")));
      AuthenticationHelper().signIn(email: email.toString(), password: pass.toString()).then((result){
        if(result==null){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You are authenticated")));
          Navigator.pushReplacementNamed(context, "/HomePage");

        }
      });
    }
  }
}
