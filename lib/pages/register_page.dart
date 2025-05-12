import 'package:flutter/material.dart';
import 'package:flutter_ecomerce/services/authentication.dart';
import 'package:flutter_ecomerce/services/validate.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final _formKey = GlobalKey<FormState>();
  final emailCntrl = TextEditingController();
  final passCntrl = TextEditingController();

  String? email="";
  String? pass="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page"),),

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
                            child: ElevatedButton(onPressed: _signUpUser, child: Text('Sign Up')),
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(onPressed: (){
                              Navigator.pushReplacementNamed(context, "/LoginPage");
                            }, child: Text('Login')),
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

void _signUpUser()async{
  if(_formKey.currentState!.validate()){
    _formKey.currentState!.save();

    AuthenticationHelper().signUp(email: email.toString(), password: pass.toString()).then((result) async {
        if(result==null){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Created")));
           Navigator.pushReplacementNamed(context, "/LoginPage");
        }
    });

  }
}


}