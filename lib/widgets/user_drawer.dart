import 'package:flutter/material.dart';
import 'package:flutter_ecomerce/routes/routes.dart';

class UserNavigationDrawer extends StatelessWidget {
  const UserNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[900],
        child: ListView(       
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(context:  context,icon: Icons.home, text: "Home", onTap: ()=>{
            Navigator.pushReplacementNamed(context, PageRoutes.userHome)
          }),
          createDrawerBodyItem(context:  context,icon: Icons.home, text: "About Us", onTap: ()=>{
            Navigator.pushReplacementNamed(context, PageRoutes.aboutUs)
          }),
          const Divider(),
          ListTile(
            title:  Text('App version 1.0.0',style: TextTheme.of(context).titleMedium,),
          )
        ],
        ),
      )
    );
  }

}

Widget createDrawerHeader(){
  return SizedBox(
    height: 250,
    child: DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        
        image: DecorationImage(image: AssetImage("assets/media/banners/banner01.jpg"),
        fit: BoxFit.fill
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
           CircleAvatar(
            radius: 70,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/media/backgrounds/ninja_1.jpg" ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.black87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Ecommerce App'),
                Text('Welcome User')
              ],
            ),
          ),
            const SizedBox(height: 10,),
        ],
      ),
      ),
  );
}

Widget createDrawerBodyItem({
  required BuildContext context,
  required IconData icon,
  required String text,
  required GestureTapCallback onTap
}){
  return ListTile(
    title: Row(
      children: [
        Icon(icon,color: Colors.redAccent,),
        Padding(padding: EdgeInsets.only(left: 8.0),
        child: Text(text,style: TextTheme.of(context).titleMedium,),
        )
      ],
    ),
    onTap: onTap,
  );
}